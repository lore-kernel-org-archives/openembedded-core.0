Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2A450605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 16:22:36 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id o3so73301638ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ZRDXqKoggJM34GX7IHs9TtxI6gfgUIIYXDFyjx+w0w=;
	b=Ci8maqQ+47Pr2ScQMreO2ICkqY3mVPBuTVzeT72FFOe1Q6LAeERpRWKW9+LCOVKrcg
	KInvEV8FGQC3zT+AvzMI0/h1N/wn1l4xKn41ok31D5LrmFvKZiMwcD7gAhI5CJ6w5Q08
	6P7Gn2r2OOJMJFJSZRaIWI6p1XaEd0vWMYBPZ+K2j1JSALCpfpGGf21Xml1q2yU49wqE
	phKiKCPvi18eI3OfGEQUujQAznFOSKRW9cSndnHwrTSt6JpMG6rlsFB4PS7gDFB4lJM0
	RvhxPJhkBhJ70jEKl5wUTKimmsPl3GCHiLiWtkFSJ0VT/scWG0vfsLtvJI4YwX6n4JMK
	a/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ZRDXqKoggJM34GX7IHs9TtxI6gfgUIIYXDFyjx+w0w=;
	b=YwdkTRvrthZFm5sentDkwhyFQ2RXaR44U/M2nh6S4koKTBteh4XuO5/2nHW2Pal85+
	NhlWgqxxf4Jz9vxzkJOcVp65BdneMjU2NnzQLFIp9uLnOeSD3rr7n98N9FjZHC39h28Z
	Uq0DVInqe/NNeb4CuHsmL/TlJvC0hDX7mnmtF2AmsNOVDoIaor7ZElYW53PlUmBrPrAZ
	/ES78Ndg7X/dtdBoZ8m/yd14uzUlVHJ/e2lrWU42Aam8k7xLN6B8tEMriYFk7FxLTdXX
	aBFPdTJGfye2I+miieX2DOsngc+QM6YLjZWvK/UQcsu7V9rM8QZKMFstZV3kZKigBTjQ
	JzHQ==
X-Gm-Message-State: AE9vXwPgutKcLlHi0aWGCTJf2/Ocs1aXeucIh5Bj8Qt2SOlVh8BenLx8v5lhw9P6qCo7aVeNYmSpBPm9toLnUpMD
X-Received: by 10.36.204.139 with SMTP id x133mr12758109itf.86.1474302156865; 
	Mon, 19 Sep 2016 09:22:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 19 Sep 2016 09:22:15 -0700 (PDT)
In-Reply-To: <CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 17:22:15 +0100
Message-ID: <CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 19 Sep 2016 16:22:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c0603065a1787053cdeb8cf

--94eb2c0603065a1787053cdeb8cf
Content-Type: text/plain; charset=UTF-8

On 19 September 2016 at 16:09, Burton, Ross <ross.burton@intel.com> wrote:

> This is being fired on the AB:
>
> ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
> do_kernel_version_sanity_check: Package Version
> (4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24) does not match of kernel being
> built (4.1.31). Please update the PV variable to match the kernel source.
> ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
> do_kernel_version_sanity_check: Function failed:
> do_kernel_version_sanity_check (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/
> linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0/temp/
> log.do_kernel_version_sanity_check.9143)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-mips-lsb/build/build/
> tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+
> b30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143


(This has happened for all the LSB builds so far)

--94eb2c0603065a1787053cdeb8cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2016 at 16:09, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra">This is being fired on the AB:</div><div class=3D"gmail_extra"><br><=
/div>ERROR: linux-yocto-4.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0 do_=
kernel_version_sanity_<wbr>check: Package Version (4.1.32+gitAUTOINC+b30b6b=
9ef2_<wbr>d6237b3b24) does not match of kernel being built (4.1.31). Please=
 update the PV variable to match the kernel source.<br>ERROR: linux-yocto-4=
.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0 do_kernel_version_sanity_<wb=
r>check: Function failed: do_kernel_version_sanity_check (log file is locat=
ed at /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-mips=
-lsb/build/build/<wbr>tmp/work/qemumips-poky-linux/<wbr>linux-yocto/4.1.32+=
gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0/temp/<wbr>log.do_kernel_version_sa=
nity_<wbr>check.9143)<br>ERROR: Logfile of failure stored in: /home/pokybui=
ld/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-mips-lsb/build/build/<w=
br>tmp/work/qemumips-poky-linux/<wbr>linux-yocto/4.1.32+gitAUTOINC+<wbr>b30=
b6b9ef2_d6237b3b24-r0/temp/<wbr>log.do_kernel_version_sanity_<wbr>check.914=
3</blockquote></div><br>(This has happened for all the LSB builds so far)</=
div></div>

--94eb2c0603065a1787053cdeb8cf--
