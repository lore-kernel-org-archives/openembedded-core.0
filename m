Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 17FDA719AF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jan 2017 14:04:15 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id c20so40328874itb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2017 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=wS77L4P/phlDa2ot29+cPxiMqSQIZpn0lD7rHBL7nzo=;
	b=F9DjJtFkD7ICIIQjSbX+V5Rnp32YKj/9AvU8GrnPrWhOGdi1gMfgvg6al2CKYCxE72
	YZfDwFYz2McDWIxP3F+q7L5AiTMCKghwBaqmzp0sURf3TAVPB2f/0IFF55MUvMlUZI69
	bH0GqIuWxNj0n+u++PkDM8tx9miQHMeMnyGjZIjrsiz+gU20Q5KTEIWJDUeo+arxoN9C
	t37pPCYNqlLuqx0VaLrlCTlCb21fqZgrXQGqfPC3AoCe8O7Z3znNcpRbOkI39+YMypC4
	gRIogmpiSzE8HKjjpRwCQiXotu/NIKq31ODIXULffU5cDXSkaLX6R4/YEbaPpDXIzzeI
	GU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=wS77L4P/phlDa2ot29+cPxiMqSQIZpn0lD7rHBL7nzo=;
	b=Y0AG9d0a/kz2qYpE7hd6RUB00E0RZ9MVnGvUu6iIEZ0qXImU0IGWl2uzPMhxu+bFJS
	eh5xV1zq7raFUZ2bGQFgMQMxEpJ/lmTm/f2kSRqBcYK+eBusFKRSyT/vQ1V7N5p6uRzv
	x+vZkoj855IXOWpiaQdLQ4Hvs70BiomS400XUk4xG3WyNlspmh1+1f/VMHotsHwEgm0Q
	XSC3hDMTpxZwNwJiVdJp8Vk23/oi9YHO6jWBSKeWH+9xxMLm+vRmU8IYWeUdzCd+p04F
	bR+6FPEDikK6F/a38HcRk+bKDkaUxbQl6bPYfauNuPu4GOimHKZu7jPP9nnYVtv9elG8
	kmUw==
X-Gm-Message-State: AIkVDXJ+CouI15RmbUu5P453/NCRW0do0mYvjADGa/WY7f8q1NAkImFdMxh0aBcTdci76OIo
X-Received: by 10.36.170.79 with SMTP id y15mr6254819iti.46.1483884255732;
	Sun, 08 Jan 2017 06:04:15 -0800 (PST)
Received: from pohly-mobl1 (p57A56C72.dip0.t-ipconnect.de. [87.165.108.114])
	by smtp.gmail.com with ESMTPSA id
	f4sm42613898ioa.18.2017.01.08.06.04.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jan 2017 06:04:13 -0800 (PST)
Message-ID: <1483884249.4383.31.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Sun, 08 Jan 2017 15:04:09 +0100
In-Reply-To: <1483868215.4360.185.camel@pbcl.net>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
	<1483776414.4383.22.camel@intel.com>
	<1483783158.4360.182.camel@pbcl.net>
	<1483815653.4383.28.camel@intel.com>
	<1483829528.4367.142.camel@linuxfoundation.org>
	<1483868215.4360.185.camel@pbcl.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Sun, 08 Jan 2017 14:04:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-01-08 at 09:36 +0000, Phil Blundell wrote:
> I'm not sure it's that complicated.  Maybe I'm overlooking something
> obvious, but something like "sort -t: -k3n" seems like it ought to
> suffice for sorting /etc/passwd and /etc/group on numeric id.
> 
> I didn't understand Patrick's comment about "id not present in each
> file" though, maybe that's the key to the extra complexity.

/etc/gshadow doesn't contain numeric IDs, so sorting has to be done
based on information gathered from /etc/groups. Not terribly difficult,
just more code.

I also wonder how to handle comment lines - remove them (easy) or
associate with the following entry (nicer)?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




