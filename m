Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB947FBAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 05:16:32 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l24so5075032qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 21:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wMYshJCgQYRQCyBppZdTFz82q6uL3sShrAsaeideYps=;
	b=ppwo+iwtYvL6S1FkUhWKp6IUnQwEJx9CnVGAMDgi08d4Hb8GqOVye8FbItXR6DKq3y
	wQgYCNbYCl14cbZPKx/KvJ8dRlKiYh798InM7k2ZLfQFauI/XdmLgkDfoFppwNTRjUNo
	pNZQxP8DbOywO8aNgbPc1xNKGMP4/Uq2oYX1lzIZukXLoWpPRIrdRhhNs3hVaARKHEHk
	ZrZKwxDPyvfQAZe5nd7LkgnsPy8f+2mrcGk7yvWqto6kKPZ4qDfbkKomR1hY579dj4i/
	WF2bFwHGG+4P+fWJK7vSkcHchY8m77pUNlnylKjxTxVEHNG/WYF69sFUhOkquvbbGay8
	8ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wMYshJCgQYRQCyBppZdTFz82q6uL3sShrAsaeideYps=;
	b=a7jzEZkrERFC50bFauS66lJICDhaA+unSvLVRfqGwTFqt0Ybsi1dwd7DVBImTIXgNB
	A+dZjoE75arbu6xB1UKYOUQiEUgBpcrE6LE7WBeryWI9FWBWe67XZ6N8Y6MjH0YkleBD
	BF8p9iHgR9catFx2Z1smHFm8FWEghZa0+r/Q+T6mQevCfpKj7r+oha+0BDZFT6YRy4V6
	v2EwdrQfLEXsPBqu4t8BUDm+gXT4hRMk8MrNK3hQk2ByWShgRcJyE5ehGcGOlaMJ/Kxb
	tVAiZM0imRVFGWZp+2XzzRShBbIUdygafACD5valwrW9yHH7YOk5ZDuhBfSUaUn/u17u
	jKYw==
X-Gm-Message-State: APjAAAXmxvZOcnPBNSGGBqQOPXpvYg6hNaiDUWc/PCLvAA8NgE9Q3sY8
	O/zCv2a3wZzAVEwXHIZTp3UKZ/x0aXsNNsW4snY=
X-Google-Smtp-Source: APXvYqzp0uggzOGmzgb6PPUpW8ZiK8SNPj22rgOD5safq6nedjUjI9UTMDr9bSJhDWKZkf5OZymXejQ5oCBb3oFNc7c=
X-Received: by 2002:ac8:66d7:: with SMTP id m23mr4086591qtp.53.1573190192751; 
	Thu, 07 Nov 2019 21:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20191107033029.95107-1-zhixiong.chi@windriver.com>
	<CAMKF1sqch6TtcwfA_FRZY=VPBTw_ueA6EVapDK9wegEjmNVteA@mail.gmail.com>
	<c61ead91-97a7-10e9-cf04-2d34c3a95479@windriver.com>
In-Reply-To: <c61ead91-97a7-10e9-cf04-2d34c3a95479@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Nov 2019 21:16:05 -0800
Message-ID: <CAMKF1sqrz8F=d=5Xv4MCmvmZzVrEUdCFN_OeLoVsPYT6pWuZXg@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Fri, 08 Nov 2019 05:16:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

On Thu, Nov 7, 2019 at 8:50 PM Zhixiong Chi <zhixiong.chi@windriver.com> wr=
ote:
>
>
>
> On 2019=E5=B9=B411=E6=9C=8808=E6=97=A5 09:33, Khem Raj wrote:
> > On Wed, Nov 6, 2019 at 9:54 PM Zhixiong Chi <zhixiong.chi@windriver.com=
> wrote:
> >> Since the Sun RPC is deprecated in glibc, the rpc header files
> >> are not provided any more, but it allows alternative RPC
> >> implementations, such as TIRPC or rpcsvc-proto, to be used.
> >>
> >> So we create the symbol link for rpc header files for tirpc to
> >> be more compatible with the glibc version and the application usage.
> >>
> > https://errors.yoctoproject.org/Errors/Details/275527/
> >
> > seems to be related to this update
> It seems the root cause is that gtkwave configure find the rpc/types.h
> and rpc/xdr.h because
> of the commit "libtirpc: create the symbol link for rpc header files",
> but it hasn't the option "--with-tirpc". So the RPC_LDADD still uses
> "-lrpc" other than "-ltirpc".
> So I will generate update patch to add the option for gtkwave and send it=
 to
> meta-openembedded layer.
>
> Thanks.
>
> >
> >> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> >> ---
> >>   meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
> >>   1 file changed, 14 insertions(+)
> >>
> >> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/r=
ecipes-extended/libtirpc/libtirpc_1.1.4.bb
> >> index e73ffe7b17..a284521c1e 100644
> >> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> >> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> >> @@ -23,6 +23,20 @@ EXTRA_OECONF =3D "--disable-gssapi"
> >>
> >>   do_install_append() {
> >>           chown root:root ${D}${sysconfdir}/netconfig
> >> +        install -d ${D}${includedir}/rpc
> >> +        install -d ${D}${includedir}/rpcsvc
> >> +        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> >> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(bas=
ename $link_header) ]; then
> >> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${in=
cludedir}/rpc/$(basename $link_header)
> >> +            fi
> >> +        done
> >> +        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> >> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(=
basename $link_header) ]; then
> >> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${in=
cludedir}/rpcsvc/$(basename $link_header)
> >> +            fi
> >> +        done
> >> +        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> >> +
> >>   }
> >>
> >>   BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.23.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036
>

