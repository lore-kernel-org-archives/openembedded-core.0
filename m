Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 2106 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 14:49:00 UTC
Received: from mail-qa0-f51.google.com (unknown [209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id AEA5965F77
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 14:48:59 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id w8so2585855qac.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 07:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Ay51WwAn38//YeMMCZjXlGoA7RJSrRmw85ORyupltCo=;
	b=KkkfYvoMQmofS3/hKQggWz7WuzLJG2NyqzihgjflJnO3oDeQt4YhbAHu+6q7E58yGu
	/znBLZzF0us/9MopQJ4JZ5Ornp8ckON5O7HaPEEjgRT/C6bdBwRyrNkhKvAETj4Ell1u
	4nmOmREfd+1kdoCcfHAwHZEB/YRCY1Le2EbS41DUsnpd4QbGUC/EZi9Rqy5NAByTsRh9
	WDwmkgpsZzCrJz8tvAzkiS9d0wJIWACRt7aCf35KotSEccyBzxQ8F5NcRt5UWJga9Bgm
	KqWr2fSlWKHFEewzkCaZXGqLYdD/bT2+TivqnBu0O+k6mrsjMWVTNpv8VtrP3LL0JncW
	SDwQ==
X-Gm-Message-State: ALoCoQlCQ1BTLndOcUudH5a/3Dg0vGUKXK4KQfAghg6nshhos7/84WQqhJXikEzDgIn4WqgycqEf
X-Received: by 10.224.115.68 with SMTP id h4mr5443612qaq.35.1399560540785;
	Thu, 08 May 2014 07:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 07:48:40 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 15:48:40 +0100
Message-ID: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 14:49:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Sorry for the cross-post but I want this to have a wide audience.

For the 1.7 release I want to move GStreamer 0.10 from oe-core into
meta-multimedia, and ensure everything in oe-core has ported to
GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
unmaintained so we don't need to be shipping both versions anymore.

Everyone in agreement?  Should I expect any hate mail over this?

Ross

