Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaCaE-0001gy-6x
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:07:02 +0200
Received: by wgbdr1 with SMTP id dr1so1202826wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=1Nc2h+Ca3Tj9gcXRwc+uOsN1nx/QZ1Vob/ywkRWRHiY=;
	b=B8mZH/kUf6vJltvSBjJojifcata1aFr/NUyrsLxVNPOD3FrCKIAzg35qgkQXXXokJa
	UMTX+4M+stnP9SW5YvwN9n4aLdhBN0QsGvRc9P/2yfrL3GDUsXnCs2q7OWRv71mE1KM1
	eK8hqFeFfwFws+0jR38Kz0A7FmaCdHNq+P/mjGilQWIqLcOr+ous8iu/diCWDsP2jx7W
	6sj1fDgoBntWe5pO80AhQEObdhLnA6VqwDvqKThYuqBMu0ymzahMqEJs3W5MgzoRuHOt
	wD8OWpC+Ypah+UyKW/FjczRTJPjcWS5mDZccBSemWLEzfTdHCQ/mcr2iXTwiHMczQnoe
	k7kg==
Received: by 10.216.143.146 with SMTP id l18mr132606wej.56.1338497802161;
	Thu, 31 May 2012 13:56:42 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id dg2sm9966274wib.4.2012.05.31.13.56.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 13:56:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
Date: Thu, 31 May 2012 22:56:44 +0200
Message-Id: <C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
	<CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] Generating device tree for building linux-xilinx kernel
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
X-List-Received-Date: Thu, 31 May 2012 21:07:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hi Adrian,

On May 31, 2012, at 10:49 PM, Adrian Alonso wrote:

> That's a second process that you need todo with xilinx EDK to export
> and launch xilinx SDK
> from there create a new device tree project which will parse the "mhs"
> hardware descriptor file
> and from there generate the device tree according to the hwd settings...

Perhaps these steps could be automated by modifying the 
meta-xilinx/classes/xilinx-kernel.bbclass file, so that the EDK gets
invoked from the command line to parse the mhs file and create the
dts file?

Best regards,

Elvis Dowson


