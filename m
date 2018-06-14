Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id E37677705D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:08:51 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id f79-v6so6663605oib.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mz1uMFo1bRwlauyx1XL/Xtdukbp8REVuOzalnEd3ShY=;
	b=Y5mLP9dDTIKhgMeATGYNeX5xh/puSGMFAnVTXD/mR9G8tQP+50xY4huoiYM5fxpQOt
	sr3xmd8IgwYc0lI9Em1RumsvgZeUUsWQbr0XHqb8f4DWA+jrl9vN/2dZmcgPlbHvZGnd
	LkzCOQxhtoYBetlmPIQpfQjacriakgJwyjg9upIrGwIzVrJBEmeVsgwbwZKEBlYvnVPd
	KjDkfnOTuM8Qg4dAmNUyb8QuHpH1J3VWuRYQCNAGEasayAvYS3hbYyqbRBqGQv+fLxmA
	rNDYCFPCAFhXicXorZ97Q7etjkBblieo9WCBNZFk082jBWnv1uMlXHS9q10TsmCAetPu
	fVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mz1uMFo1bRwlauyx1XL/Xtdukbp8REVuOzalnEd3ShY=;
	b=ICMnhB8v/eJGaIOhZFjWteGfEDGhw4uKgV/wYd9KEjM1g/5anKgPSNMVKYnohlpLQ3
	4QsjewCr9biWh6ZPzFf89Mkf+8/brwmrU+KFbc6kpcl4m7Bfi8uMrgDQh3gzSt/ysfN+
	BNQ8nOmESDZR4Tspkzft2rkR3b94iSfiwmnG/3tx/7g9cwt5gs2tSooH9+1o1KCDyA3p
	ZLPc8b7QUzUT0bjLqytXZoM/ntQ/qVS3WIj7sOn02DCUvBEiua6e9OsmemkCFzZ9Znqm
	01ypjCKbsi/tvy2Rut/0jS0+Hcq96hRXUts+ffp1wlZdK7YNLINXiwSlpPb8ua1elRDQ
	WHwg==
X-Gm-Message-State: APt69E3Ch5+nO2MVXikOQTJqorgfK/awZMjE1uvLA2elt+MFtaPWPvI/
	MwnKh6YvdKoiATEV+wNtqfkji6rWGg6Z0jiz9OU=
X-Google-Smtp-Source: ADUXVKIcoKoG4VRgVcgKEg10PGESJgebFQksSz72eBsfml8pHU25vbBC1VNiHON5fosL9CN3liF8iABEsEEsnWutbxQ=
X-Received: by 2002:aca:41d6:: with SMTP id
	o205-v6mr1998170oia.38.1529003332954; 
	Thu, 14 Jun 2018 12:08:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 12:08:52
	-0700 (PDT)
In-Reply-To: <72038ce45486336b7f3d611d7181e95f@agner.ch>
References: <20180516091352.29279-1-stefan@agner.ch>
	<84556032da03a0e29a955e347028db45@agner.ch>
	<bbbf2ec8-8c75-5195-b0ff-475c499853e3@linux.intel.com>
	<72038ce45486336b7f3d611d7181e95f@agner.ch>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 22:08:52 +0300
Message-ID: <CANNYZj_0cKie+XytpFL_qQ2oS_K4kBQL226CFkybqSwujOy_GQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] postinst fixes for opgk/dpkg
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
X-List-Received-Date: Thu, 14 Jun 2018 19:08:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No need to be nervous. The patch will make it in; patches do not get
quietly rejected. If it hasn't showed up yet, it's most likely because
the patch will be tested on the autobuilder in a separate set from the
'regular patches', or (yes, this happens) it has slipped through the
cracks. In that case (I know it's impossible to tell from the
outside), just resend again.

Also, please do help us out with oe-core patch review and recipe
maintenance, particularly updating them to latest versions.


Alex

2018-06-14 16:57 GMT+03:00 Stefan Agner <stefan@agner.ch>:
> On 04.06.2018 18:18, Alexander Kanavin wrote:
>> On 06/04/2018 07:06 PM, Stefan Agner wrote:
>>
>>> Anything holding us back merging this changes?
>>
>> Please read the Yocto project status mail:
>>
>> " =C2=B7         Patch review/merging was slow over the past week due to
>> Ross being on vacation and changes in Richard=E2=80=99s employment/hardw=
are
>> situation but at least some of the backlog was resolved over the
>> weekend and the hardware issues should be worked around now."
>>
>
> Gentle ping on that again.
>
> This week it read:
> "Due to the milestone, patch merging is slowing to stabilize."
>
> Also, there have been patches merged which were posted after this
> patchset... It is really rather important for us since it is hard to fix
> in lower layers...
>
> So I am getting nervous whether it still makes it?
>
> --
> Stefan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

