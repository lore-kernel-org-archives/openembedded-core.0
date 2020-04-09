Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.4567.1586417543449094664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 00:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5ZytMKi;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id j4so3005036qkc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 00:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o8dVqiNd6NTLdi99/ydQRlRO0NpTea0okTI7CS7R7DA=;
        b=D5ZytMKirmS8XiNx81ypftghZdjo6hfoLgDuz2vkM6DVYuLV9GScB3+YWDvx0FBj3/
         uUkzBCbE0g4mVtt8rbnRPHQq2wILEs8zjWmPK/6yzO2iKEk58LmCoN1iQcFcICjV67ae
         BZ8SnBezZ/41dAcL7zTu6oMBxH4O+RhGMow1D3Q7mjL/jcQxJ1BtvaWysKJN5NzmzdeM
         ynDzIRMqolbcqh2ISb5+uRxOVY3nJbD7iP57VKgWpEFnydVp6PiTMbzmU+GFpe65JfZe
         Trod6U4zY4LAuCzREzjS8/Ve9NPjawO/gDZ7/vr40ZZli5Vx8ILTw08S6yZkGRgv3lfV
         7yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8dVqiNd6NTLdi99/ydQRlRO0NpTea0okTI7CS7R7DA=;
        b=swTnM7Xz9gxn/OJg94T0EtPYnvAFSMgaGc6kO7nbU1dO/sPwtp1jRjAti264SKMKpm
         bRti8CkInWDuWRKFKdr/opPLovdVJruWyC00ZpXWk1asQPmP83R/yDiozMnZAmvXshdc
         w324wxHlSB+v9LA0MGCrfkgDH3voTo/PzgGrTKhRjC91HuUDLxErf5MtPMRK+qvkkJ6/
         2E5P5cksPip/XUg6xmis3eUq28Scs769iJ88ia0lRuNa/iCeocElgh6Q8DZDDkbKRKlM
         z5A/YdLW/VTNMLrBvIQXHe73uXGFgKhRKTfcHyoSuYEz7/XValF1pZjreHYnEXYyAXbO
         DQFA==
X-Gm-Message-State: AGi0PuaNrIxuAmtAqKe5YIltf56/vAsPZh27VHwtylDHiSHSDPD71G7Z
	4iGQhpRhY0X+WtbA0ZMKF788n4cXXmkWxsgf2eLc4u9q
X-Google-Smtp-Source: APiQypI0iiWy3B+bv0dnUDLNYdFHJLifdkJk6BM3B+PcDLyzVp2f/aHTHxVPI0Vq6U4Sl0K46nf2HsY2mHeoDz/a47I=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr11246610qkf.165.1586417542361;
 Thu, 09 Apr 2020 00:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
 <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
 <CAMKF1sox5DY7Zh5EN5onjGArv0ZTH=+L6+H8dQZtmcHCgFru2A@mail.gmail.com> <CAMKF1sqfqFvK3U7b_59Au=Ko8fWEevRBndNGCEnCdBPpMtw5Ag@mail.gmail.com>
In-Reply-To: <CAMKF1sqfqFvK3U7b_59Au=Ko8fWEevRBndNGCEnCdBPpMtw5Ag@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Apr 2020 00:31:56 -0700
Message-ID: <CAMKF1sqepk11V3DAPx7=R9UegE+P9Uv5789QzQdSAr2TFfbTJQ@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

the patch I proposed make the problem in bug report fixed but would
require more testing, this patch I feel is disabling it completely,
perhaps we need to either let release go as such and backport the fix
since I think multilib should be fine witth musl we might have some
quirks to take care,

On Wed, Apr 8, 2020 at 6:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 4:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 8, 2020 at 4:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > As discussed in the bugzilla entry, musl is not compatible with multilibs
> > > > and has no plans to support this. Therefore tell users this from the
> > > > recipe rather than letting them run into build failures.
> > > >
> > >
> > > I dont think thats the case anymore, I have sent patches to fix
> > > multilib on musl.
> > > this seems a broad brush. What are you trying to fix ?
> > >
> >
> > I see the bug list a fix that was done last year as a workaround to
> > disable multilib headers that should be reverted something like this
> >
> > diff --git a/meta/classes/multilib_header.bbclass
> > b/meta/classes/multilib_header.bbclass
> > index e03f5b13b2..48f231eed0 100644
> > --- a/meta/classes/multilib_header.bbclass
> > +++ b/meta/classes/multilib_header.bbclass
> > @@ -6,13 +6,6 @@ inherit siteinfo
> > # all of the ABI variants for that given architecture.
> > #
> > oe_multilib_header() {
> > -
> > -       case ${HOST_OS} in
> > -       *-musl*)
> > -               return
> > -               ;;
> > -       *)
> > -       esac
> > # For MIPS: "n32" is a special case, which needs to be
> > # distinct from both 64-bit and 32-bit.
> > case ${TARGET_ARCH} in
> >
> > would be more appropriate now a days.
> >
>
> I have now tested the above patch and sent for review to ml.
>
> > > > [YOCTO #13122]
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  meta/recipes-core/musl/musl.inc | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> > > > index bdce412162c..f2f3d3d054b 100644
> > > > --- a/meta/recipes-core/musl/musl.inc
> > > > +++ b/meta/recipes-core/musl/musl.inc
> > > > @@ -29,3 +29,9 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> > > >  B = "${WORKDIR}/build"
> > > >
> > > >  do_configure[cleandirs] = "${B}"
> > > > +
> > > > +python () {
> > > > +    multilibs = d.getVar("MULTILIBS")
> > > > +    if multilibs:
> > > > +        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
> > > > +}
> > > > --
> > > > 2.25.1
> > > >
