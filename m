Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 89E3179558
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:42:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1535042532; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=N8TVeKEmr12NuB/cvtGMmXIYrMPdR7JSI/EG8Zrd1Dw=;
	b=dgO81hUJmCO+Osem5+bksTZAQFm/eOf99+a4mhecz+exuVpwLq/PZ9EchB9ps/HUQQFUINPM
	kQqWsuNTKXGC9HQDUGoEXin4ITSBkI7gkem+NW0elSID0e4HxEVmEa3p7PtwnX9dfnMEKgDJ
	iS4qVcmp1fUJLZaDT5k+YYnR0Sk=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 5b7ee370.7f3c35bcc070-smtp-out-n01;
	Thu, 23 Aug 2018 16:40:16 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id p81-v6so8404846itp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:40:16 -0700 (PDT)
X-Gm-Message-State: APzg51Db5Qzbuoj6UVPI3rWKndeNTIB3rBdsieBGhs7/wKZk/W2NFrHr
	uWNlM23jHrD4QTGIJqaznScIWxMtkKQLqrrCZxM=
X-Google-Smtp-Source: ANB0VdYn9zXUUpWJHJpM9bK+dh7xXaWxHVFQG6aJ00rFKCvNHonSxUbk4SaoH2HixiAcv/225K5F+qcXo5F307oq0/c=
X-Received: by 2002:a02:dc8:: with SMTP id
	191-v6mr10027077jax.117.1535042416245; 
	Thu, 23 Aug 2018 09:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
	<188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
	<CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
	<5a6bf05b6a04f09ed3f148c996a2b6d0d562924d.camel@linuxfoundation.org>
	<CABcZANmK_H5kPGp2UQMBTszEXW3D++f8404c-GANqpaRShzffQ@mail.gmail.com>
In-Reply-To: <CABcZANmK_H5kPGp2UQMBTszEXW3D++f8404c-GANqpaRShzffQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 23 Aug 2018 12:40:04 -0400
X-Gmail-Original-Message-ID: <CADNbA1qYW6AzgTmiCuwVj_XkEmFq7rqWCoz+5dBP_PPtuH_79w@mail.gmail.com>
Message-ID: <CADNbA1qYW6AzgTmiCuwVj_XkEmFq7rqWCoz+5dBP_PPtuH_79w@mail.gmail.com>
To: kergoth@gmail.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 16:42:11 -0000
Content-Type: multipart/alternative; boundary="000000000000ef80ab05741ce92b"

--000000000000ef80ab05741ce92b
Content-Type: text/plain; charset="UTF-8"

+1 for this being opt in.  It's a substantial hit to build time

On Thu, Aug 23, 2018 at 12:21 PM Christopher Larson <kergoth@gmail.com>
wrote:

> IMO PGO should really stay opt-in, not opt-out, given the performance
> impact.
>
> On Thu, Aug 23, 2018 at 1:28 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2018-08-22 at 18:44 -0700, Andre McCurdy wrote:
>> > On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal <anuj.mittal@intel.com>
>> > wrote:
>> > > On 08/17/2018 03:31 AM, Andre McCurdy wrote:
>> > > > On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.
>> > > > com> wrote:
>> > > > Is it important to re-create the profile data during every build
>> > > > or
>> > > > would we get most of the same benefits from using reference data
>> > > > which
>> > > > is generated offline?
>> > >
>> > > We should get the same benefit using the data generated offline as
>> > > long
>> > > as the source code/configure options/flags are same I believe. I
>> > > have
>> > > only tried with data generate offline using the same build
>> > > configuration
>> > > though.
>> >
>> > As an additional data point, python do_compile now takes approx 18
>> > minutes on my laptop. A single qemu-i386 thread loading one CPU core
>> > at 100%, with nothing else being scheduled in parallel for most of
>> > that time.
>> >
>> > If we can get most of the benefits of pgo with a pre-generated data
>> > file then that might still be something to explore.
>>
>> I've also noticed the increased build times. I'd love to see if we
>> could create an sstate object which would contain the pgo data and
>> which didn't depend on the usual compiler/toolchain pieces, only the
>> do_patch stage checksum. In theory, the same sstate object should be
>> reusable between target/native/nativesdk too as long as we had the same
>> python patchset (which I know we don't for native).
>>
>> Anyone fancy such a challenge? We should probably have a bug open for
>> this at least...
>>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ef80ab05741ce92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+1 for this being opt in.=C2=A0 It&#39;s a substantial hit=
 to build time<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Thu, Aug 23, 2018 at 12:21 PM Christopher Larson &lt;<a href=3D"mailto:kerg=
oth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">IMO PGO should really stay opt-in, not opt-o=
ut, given the performance impact.<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Thu, Aug 23, 2018 at 1:28 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Wed, 2018-08-22 at 18:44 -0700, Andre McCurdy wrote:<br>
&gt; On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal &lt;<a href=3D"mailto:anu=
j.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On 08/17/2018 03:31 AM, Andre McCurdy wrote:<br>
&gt; &gt; &gt; On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal &lt;anuj.mitta=
l@intel.<br>
&gt; &gt; &gt; com&gt; wrote:<br>
&gt; &gt; &gt; Is it important to re-create the profile data during every b=
uild<br>
&gt; &gt; &gt; or<br>
&gt; &gt; &gt; would we get most of the same benefits from using reference =
data<br>
&gt; &gt; &gt; which<br>
&gt; &gt; &gt; is generated offline?<br>
&gt; &gt; <br>
&gt; &gt; We should get the same benefit using the data generated offline a=
s<br>
&gt; &gt; long<br>
&gt; &gt; as the source code/configure options/flags are same I believe. I<=
br>
&gt; &gt; have<br>
&gt; &gt; only tried with data generate offline using the same build<br>
&gt; &gt; configuration<br>
&gt; &gt; though.<br>
&gt; <br>
&gt; As an additional data point, python do_compile now takes approx 18<br>
&gt; minutes on my laptop. A single qemu-i386 thread loading one CPU core<b=
r>
&gt; at 100%, with nothing else being scheduled in parallel for most of<br>
&gt; that time.<br>
&gt; <br>
&gt; If we can get most of the benefits of pgo with a pre-generated data<br=
>
&gt; file then that might still be something to explore.<br>
<br>
I&#39;ve also noticed the increased build times. I&#39;d love to see if we<=
br>
could create an sstate object which would contain the pgo data and<br>
which didn&#39;t depend on the usual compiler/toolchain pieces, only the<br=
>
do_patch stage checksum. In theory, the same sstate object should be<br>
reusable between target/native/nativesdk too as long as we had the same<br>
python patchset (which I know we don&#39;t for native).<br>
<br>
Anyone fancy such a challenge? We should probably have a bug open for<br>
this at least...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"m=
_4532180818432277067gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software E=
ngineer, Mentor Graphics</div></div></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ef80ab05741ce92b--
