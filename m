Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D4B3B771B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:51:42 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g203so190497158iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 07:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vuGOjkfWhLmiQIjGBex+2n7vDg+lOVpa+w98lcat4gA=;
	b=qMQAeqmEdzbF+tNfNAeOhYO2DFp6sv1l5QOs5D5/WbJPyJB0c2o3WZPaRXTkjlCQac
	iiraFGOJOVbfBxZU+F/ZgWLUYT0EpDkMsbgctJmetV49WGgFN/yUCwWs+rcC1sSZxxZw
	X71UMBmdPBPaEEMaPKePIChN6Fo/x/i8/XQQlulvFnP+Es/btXIWtDvAwJhbJ4UHGiQt
	jBu3gzN1qs0z4MqV/8z9QDoVdXdWy9d/IHcuRVmbLRRRoIsQ3W5p4DY6r1EfWGD4cjNV
	DXlrvyj0H45+QN5ZOUBDcyS/+0trsFfWdCK3myldzcqX6Oth6XceaULsYIBmIfIZrczZ
	rR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vuGOjkfWhLmiQIjGBex+2n7vDg+lOVpa+w98lcat4gA=;
	b=MlRvnAM8yxryey7iCRJDcoPGpSFT6Od3i+Vi5lYCL9Ey08xLm4CuSUlt8j4DotoROL
	6C5OIdtxlFKM1Q2gZkEslUulYjdnWNMOKgS4lC+pCHnIWG8Y9AmKc/tNqC6MwxjTDlgc
	9rglc/qEAvdk0U+3orCreYO4rxGk5zNN1ooXEjhbGDOubEzWlKkFQhWaqqsI/yItJYjt
	DBK9kOUi+okHrgg7onVPkUp2nTTCOsM5+ksFmW6mnVtkTopaj1HPctprAvipPjA8v7PH
	nRljohisFPpVltfmRU3J842+PiN3vIcSW7+ISq6JmDRoc2XHfJDB0ftIlBzA/Jf1K/gj
	5UfA==
X-Gm-Message-State: AG10YOTG38SWp8IZPav1XUpsDV5m4nPpAHjfhVuC+FrfoeFgv0WecROyFkfP4/s86s4K96YBoMihVn4xU2DFcID9
X-Received: by 10.107.137.92 with SMTP id l89mr22377457iod.133.1456761103235; 
	Mon, 29 Feb 2016 07:51:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 07:51:23 -0800 (PST)
In-Reply-To: <1456760913-19518-1-git-send-email-dmitry.rozhkov@linux.intel.com>
References: <1456760913-19518-1-git-send-email-dmitry.rozhkov@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 15:51:23 +0000
Message-ID: <CAJTo0LZcHLifps_gOPtdNZ7F=Lod0GaNK3543JwnK-LSL9rHFQ@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libarchive: Set xattrs after setting times
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
X-List-Received-Date: Mon, 29 Feb 2016 15:51:43 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb414f628052ceaa0c8

--001a113ebdb414f628052ceaa0c8
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 15:48, Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com
> wrote:

> Upstream-Status: Submitted [
> https://github.com/libarchive/libarchive/pull/664]
>

This should go in the patch header alongside your signed-off-by.

(
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations
)

Ross

--001a113ebdb414f628052ceaa0c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 15:48, Dmitry Rozhkov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dmitry.rozhkov@linux.intel.com" target=3D"_blank">dmitry.rozhkov=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":3uz"=
 class=3D"" style=3D"overflow:hidden">Upstream-Status: Submitted [<a href=
=3D"https://github.com/libarchive/libarchive/pull/664" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/libarchive/libarchive/pull/664</a>]<br>=
</div></blockquote></div><br>This should go in the patch header alongside y=
our signed-off-by.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">(<a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Mess=
age_Guidelines#Patch_Header_Recommendations">http://www.openembedded.org/wi=
ki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations</a>)</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113ebdb414f628052ceaa0c8--
