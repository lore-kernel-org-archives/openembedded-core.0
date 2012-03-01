Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1S35ao-0005VB-Bh
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:58:46 +0100
Received: by obqv19 with SMTP id v19so690457obq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 04:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of slapinid@gmail.com designates
	10.60.25.65 as permitted sender) client-ip=10.60.25.65; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of slapinid@gmail.com
	designates 10.60.25.65 as permitted sender)
	smtp.mail=slapinid@gmail.com;
	dkim=pass header.i=slapinid@gmail.com
Received: from mr.google.com ([10.60.25.65])
	by 10.60.25.65 with SMTP id a1mr2425619oeg.23.1330606216063 (num_hops =
	1); Thu, 01 Mar 2012 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2KlBDopTcuY9bEsW6RWVFMfzUWBZXYPfxW4L8EiPiCw=;
	b=Y/dWPfUHHVguEwICc+UVnla3kBjBPv7ONj9Kz5x+wIN8kmw554dXz94jAsO+DmptJg
	jGRP9ezZUeR/PSbl6uF8DVxg0iudObgRJwPDfjWSa+lzLNm/+z3y0eD9LUAWhowAUL1f
	yXzMsfI+1aOnce3zeDPiqhWEDvCbZDzlMUP0Q=
MIME-Version: 1.0
Received: by 10.60.25.65 with SMTP id a1mr1962711oeg.23.1330606216031; Thu, 01
	Mar 2012 04:50:16 -0800 (PST)
Received: by 10.60.39.39 with HTTP; Thu, 1 Mar 2012 04:50:16 -0800 (PST)
Date: Thu, 1 Mar 2012 15:50:16 +0300
Message-ID: <CAFZPMoaRYRE1Brig5x-1tnECa1AnFWfYfgg5Gx9qrRsB1EFH4w@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: multiple kernel builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 12:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

How could I achieve multiple kernel packages builds in single build?

I need multiple kernel configurations for single hardware (which will
live in single build and booted on
request). So I need to put 2 uImages on one ubifs partition or
different mtd partitions, which is ok.

But I need to build both in single run.

Any ideas?

Thanks a lot,
S.


