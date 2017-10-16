Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 841C16FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:32:07 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id n137so17530073iod.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XhiBelTc8gkkzSBCMSDz++oOBzsD82dC9J72iExVEHU=;
	b=SJIlLAuFYw/uopDNbQxF2OvU2kPFOLhk3EyMG+Yg9YPPCTzcsThNR+Tueg0TgFbrTD
	H6RZqCbx2zzvrK3eokiNs8UIjfcb4kzTgjCgv1gUHJ/vneJkzSmUVRH+wIfn24xVMWbW
	BUeeYmHkXr93qw+TjWDJJP2uL0EKIVfW2LJ1NeFgW9WHMoKkmh++BsTUSemUmqO2s3Il
	UIyXfuq+ZR7FqPkuHHi4MXJqJmfmHVSgkGCz/jGnFxQyayP9/QgIKSR0HqYR7CNiKKkS
	BSlhEdLnbd/F6l0NAPcuRd74uOChWa38sqq9319x7XBkW7QABHLfcuaqktUxVf58TXCA
	ESsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XhiBelTc8gkkzSBCMSDz++oOBzsD82dC9J72iExVEHU=;
	b=W2BB30xrxwil+XaAPSpYdl31u5EPYBWBYQ/doG7DvIL9wrqx7iQfNsef2jzVWqMtsR
	AgQpA9SilOawYes9Chw30SkTwgKFGbC2HGiwpfcwRWUMUs6fwvkB5SKjI3/o1eorVLEc
	U6X49yOqRfvWI9tKdzh1wALltL5lpQo0xyg5FDbJrDFOqeDlaQl5ewl4kSSCHrtMzMXK
	AuU49lrZdrw/ESofNB4lZdvdska88SV0oYJMFFPOH+v4aKrKogvAubMSeypYqyGCKF8m
	T1QJGywR0Mv+bC1SwXGFXDk5CHGQv+rnJh7clPUc2Fh9Upt78LPxL/zaR7NUto5XdAlV
	hmcg==
X-Gm-Message-State: AMCzsaW6oVMSdW+/+bARfeED8MKVz9QnJk6IiUxs0sdTbox92QO4OT6K
	l9ls2HNnrjs+ZqDA7W3ImdzxV6LXHHbAMK1c9GzDIA==
X-Google-Smtp-Source: ABhQp+TfJ0CbIrozm7tjJEMgPVAFnt9XYkdrX+SKGOkETC+XqpoR74kz71LWC2g4CI9S+JaaGDu3+Xca2etDhgbm/cQ=
X-Received: by 10.107.18.67 with SMTP id a64mr15255240ioj.165.1508185929484;
	Mon, 16 Oct 2017 13:32:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 13:31:49 -0700 (PDT)
In-Reply-To: <20171016174814.GV9221@denix.org>
References: <1507836933-142066-1-git-send-email-denis@denix.org>
	<CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
	<20171013162825.GN9221@denix.org> <20171016174814.GV9221@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 21:31:49 +0100
Message-ID: <CAJTo0LZMbLTY8v-yob9SBazYDpM_4QVDYKAuV6VreUmymcJVZw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Mon, 16 Oct 2017 20:32:08 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b295269f055bafe68e"

--001a113ee9b295269f055bafe68e
Content-Type: text/plain; charset="UTF-8"

On 16 October 2017 at 18:48, Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Oct 13, 2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote:
> > On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote:
> > > On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > >
> > >
> > > One day I'll figure out why quilt appears to be non-deterministic about
> > > this but:
> > >
> > > ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt
> --quiltrc
> > > /data/poky-tmp/master/build/work/all-poky-linux/wayland-
> protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
> > > push' exited with 0  Output:
> > > Applying patch usesysrootprefixforpkgdatadirvariable.patch
> >
> > I don't see this patch in master. Works fine in distroless and poky from
> > master.
>
> Ping.
>

The patch fails here, so I'm waiting for a v2.

Ross

--001a113ee9b295269f055bafe68e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 October 2017 at 18:48, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Oct 13, =
2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote:<br>
&gt; On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote:<br>
&gt; &gt; On 12 October 2017 at 20:35, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">=
denys@ti.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys=
@ti.com">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; One day I&#39;ll figure out why quilt appears to be non-determini=
stic about<br>
&gt; &gt; this but:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: &#39;qu=
ilt --quiltrc<br>
&gt; &gt; /data/poky-tmp/master/build/<wbr>work/all-poky-linux/wayland-<wbr=
>protocols/1.11-r0/recipe-<wbr>sysroot-native/etc/quiltrc<br>
&gt; &gt; push&#39; exited with 0=C2=A0 Output:<br>
&gt; &gt; Applying patch usesysrootprefixforpkgdatadirv<wbr>ariable.patch<b=
r>
&gt;<br>
&gt; I don&#39;t see this patch in master. Works fine in distroless and pok=
y from<br>
&gt; master.<br>
<br>
</span>Ping.<br></blockquote><div><br></div><div>The patch fails here, so I=
&#39;m waiting for a v2.</div><div><br></div><div>Ross=C2=A0</div></div></d=
iv></div>

--001a113ee9b295269f055bafe68e--
