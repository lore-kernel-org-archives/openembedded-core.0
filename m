Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4981671A72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 15:54:28 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id b35so17924023uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 07:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=98xl3JF06yl2pwqGQfP/edOokVuoWhxkCD0RDAUTrRQ=;
	b=dE1x9qKAXXoxOzv/05cuG03jQdzujz/a7wsrMgOBJo5IitqA9qN5pqoRDA5sTXUYp6
	ctnAma3hXNG3m/jU9nVkGiRUHz9hvkVGRQ8Q5znbznrBXd4Fq8RVR2qOtq4Ky1Ed5/ds
	MeAK0e87sx2ghTb534dsLYq3lMUotZSZWx2ndaFjoJ4ViSWfoA9pqNHJQxSc4Xj6uNJ9
	tmmPQSM3N95KDKsKtt61r+84rcvoOozcgLZ1vYlJO3ZGx6SB8U8z1fSSXRm1nsspXtiX
	Wzm48i9iyG4vY9BAWoVqPry8BauhZlRClzLBm+Lmg8IsvmtGUN0R5WtOZLj8ax1WYovJ
	c3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=98xl3JF06yl2pwqGQfP/edOokVuoWhxkCD0RDAUTrRQ=;
	b=KJpJXd3Gw00qD8SdmEEx44nhgnevpvlSMGJUYP8HMoXt2Ob+RuRL9dfoXq0ogtIb81
	odcaCjegegG8dUj7jT0oCmSMInAUsD0XOV/MTmASf5IS8w7Y3y6ETkbjW5ms3sDtmGVW
	POLHAVpXOGvfGxFnOOafS854cIo//QHcNmlUGJQLkVZI0mhwBEO4YN4MwCCCPNJMxRC8
	ZpHY1GbxL42kDLgpykcmRu+yHGEeUGevEGa/m8uQ8HEeG66FCZkAyr+aZcbErapvW3dI
	qMHl7mNRqYAjxaJr3kggiMGcW28brEHyfZbUKPQjOkpmd3Mz3ZLfmhRO9i+oEiCbJtR0
	84fQ==
X-Gm-Message-State: AKaTC01S3oeRmpQ2h9fLfenC/+CvEabraVtkuu+spyEp8XzCKzjgj8zdgHwbbQ/Tztmi7sG6gajEVBLsSUMObg==
X-Received: by 10.159.48.146 with SMTP id j18mr25326576uab.6.1480521269089;
	Wed, 30 Nov 2016 07:54:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 30 Nov 2016 07:53:58 -0800 (PST)
In-Reply-To: <CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
References: <20161130073953.18166-1-raj.khem@gmail.com>
	<CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2016 07:53:58 -0800
Message-ID: <CAMKF1so-tFm642AyEoh0hqNSGcKdnOWrSP67D5hvruxiUTqVug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Upgrade to 1.10.1
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
X-List-Received-Date: Wed, 30 Nov 2016 15:54:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2016 at 7:17 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Breaks if built from a empty sysroot with wayland enabled:
>
> gst-plugins-bad:
> | make[3]: *** No rule to make target 'viewporter-protocol.c', needed by
> 'all'.  Stop.
>
> Also rtsp-server gains various runtime dependencies on util-linux, can you
> verify that these are expected and in the depends?

I havent done individual builds so there might be issues let me do
these and send v2

>
> Ross

