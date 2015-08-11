Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB4E767F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:29:28 +0000 (UTC)
Received: by qged69 with SMTP id d69so140269834qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4Rd9sWVpUQ/AgZKe0BoqWhSbOpqQCBVgE7n92pPXhUU=;
	b=TxUBYV2NtlyVjJzxRbf60LV+4wQQvBgRyPX1qBXk+/H3YI85RL5x6WuzuXkaEopbPx
	uFSN7xGcG4g1HyAWIoLHlLMdWYGBSjfFqmJuMBoBUKCP+lNHqf3j6akPAtMKGsSNhiU0
	XmVH/jjZ5ONBrXO7N5vLvRtx9FHI9UaKrWSgU/ZSh55qq+j2y6BFjfAIU4sVPoK4bxKV
	IprcT5lwNgjWB3EM3qtGEYwPfmF4JiKPFco03Izcos6sqVh+ftT0VF1WKDZ5+xZks3jn
	yuQvpuORTnN7lGPOqkj02vn7AWTZ5tzMLqGMKogPhg2rvt1WnxY/tWF9CsXFp4I5avuB
	b3BQ==
X-Gm-Message-State: ALoCoQlPYf5LCwjuJh4bjlNTPlPDhUy557ojY2+QyEDdk7SAMgDwzAupT5NqMXlE0t98CODFjzMD
X-Received: by 10.140.43.199 with SMTP id e65mr48904406qga.80.1439303368887;
	Tue, 11 Aug 2015 07:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 07:29:09 -0700 (PDT)
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 15:29:09 +0100
Message-ID: <CAJTo0LZSK7oknJ5taH4J2ma-5hMqWSCbW2qZnOcfzjh3g26kSw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] preserve xattrs in images
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
X-List-Received-Date: Tue, 11 Aug 2015 14:29:31 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa06e61c051d09ee06

--001a113a9baa06e61c051d09ee06
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

On 11 August 2015 at 09:44, Patrick Ohly <patrick.ohly@intel.com> wrote:

> The default does not get changed because supporting xattrs causes a
> certain overhead (need to build GNU tar, additional system calls when
> creating the images).
>

Two questions:
1) Do enough host distributions not enable xattrs in tar that we need to
depend on tar-replacement-native?
2) Have you timed the overhead of enabling xattr archiving on an image that
doesn't use xattrs?  (subtext: does this need to be an option).

Ross

--001a113a9baa06e61c051d09ee06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Patrick,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 11 August 2015 at 09:44, Pat=
rick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick.ohly@intel.com" t=
arget=3D"_blank">patrick.ohly@intel.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div id=3D":368" class=3D"a3s" style=3D"overflow:hidde=
n">The default does not get changed because supporting xattrs causes a<br>
certain overhead (need to build GNU tar, additional system calls when<br>
creating the images).</div></blockquote></div><div class=3D"gmail_extra"><b=
r></div>Two questions:</div><div class=3D"gmail_extra">1) Do enough host di=
stributions not enable xattrs in tar that we need to depend on tar-replacem=
ent-native?<br>2) Have you timed the overhead of enabling xattr archiving o=
n an image that doesn&#39;t use xattrs? =C2=A0(subtext: does this need to b=
e an option).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a113a9baa06e61c051d09ee06--
