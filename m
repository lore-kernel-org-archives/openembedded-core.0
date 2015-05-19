Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id D3839601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:03:48 +0000 (UTC)
Received: by qget53 with SMTP id t53so7476011qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4T02aW5zfRxjObIvDux6C/fRBa/TNLoh6Dt4ftAB5II=;
	b=KoH4HfIqIXwuQy94KFbrq1Y42QifPdtmhdtR4f2gIIEZhU+UttYMeGpsrSBZIvCzIh
	s5R3Bo08HRWSIV3eg2IDLvKvKfrJfKpMKxeXJBezVkD7fRH4yGhjhzZ+bzUX3so3gIy/
	9Vaw6b7MAoc9gP5Fzo68v0Yx06FIFxiCMg/490NZefTVpZPnDRvDt1JRCltv+udWeyLa
	FAFsjq2Xr1fdIEYzw30Cb6/EDZRjZKdVIU87gcLIJNWkB6XEdiAvGKbskSQu8RIBEbML
	levxu+q7MWOFNaXxsNUtprFCZHUSYeNmX7H/2SKg6l9xThjVVLeXa7lfbW35PfFG4yIi
	nN3Q==
X-Gm-Message-State: ALoCoQnNuRl/1wzRd6RI3hFT/s/Uky/inJmeYi5XOVb12zgSkT38VOQy9kEUO1OMbkoLrURi1rMd
X-Received: by 10.140.133.199 with SMTP id 190mr15399729qhf.17.1432044229419; 
	Tue, 19 May 2015 07:03:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:03:29 -0700 (PDT)
In-Reply-To: <1431957520-14510-7-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1431957520-14510-7-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:03:29 +0100
Message-ID: <CAJTo0LZoWN0upkf4kE_Lcb51OTW-zWMJo+dSiMymNDFaiKNoOg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gstreamer: remove 0.10 recipes
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
X-List-Received-Date: Tue, 19 May 2015 14:03:56 -0000
Content-Type: multipart/alternative; boundary=001a1135339098fb5b05166fc7c1

--001a1135339098fb5b05166fc7c1
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 14:58, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  delete mode 100644 meta/recipes-multimedia/gstreamer/
> gst-meta-base_0.10.bb
>

This recipe provides the gst-meta-audio and gst-meta-video packages that
the testapps packagegroup depends on (meta/recipes-core/packagegroups/
packagegroup-core-tools-testapps.bb).

I never liked those packagegroups as they were an arbitrary and mostly
useless subset of plugins.  Please remove those lines from the testapps
packagegroup: gst-player already recommends the metapackages for
base/good/bad/ugly so test images will have the full set of plugins anyway.

Ross

--001a1135339098fb5b05166fc7c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 14:58, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":a=
2a" class=3D"" style=3D"overflow:hidden">=C2=A0delete mode 100644 meta/reci=
pes-multimedia/gstreamer/<a href=3D"http://gst-meta-base_0.10.bb" target=3D=
"_blank">gst-meta-base_0.10.bb</a><br></div></blockquote></div><br>This rec=
ipe provides the gst-meta-audio and gst-meta-video packages that the testap=
ps packagegroup depends on (meta/recipes-core/packagegroups/<a href=3D"http=
://packagegroup-core-tools-testapps.bb">packagegroup-core-tools-testapps.bb=
</a>).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>I never liked those packagegroups as they were an arbitrary and mostly use=
less subset of plugins.=C2=A0 Please remove those lines from the testapps p=
ackagegroup: gst-player already recommends the metapackages for base/good/b=
ad/ugly so test images will have the full set of plugins anyway.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135339098fb5b05166fc7c1--
