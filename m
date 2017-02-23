Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 50E6472F7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:14:16 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id d9so4031947itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=IBdXOuUdw6KN7MvoGlFCLjV3XFSwFd2K91d5YkiyaCA=;
	b=NBsVkR3A4ruPIE5GqCZiAswQtZvsryLTPax6rM/zQoifoNQG9mOWCA74VDapeyhasN
	Nbgl6N2VPYirMS35+pP2q3iHlg+hzt3oAXSzq4QUI8XciRaCfIGtQNi//pOf+uKu+s2j
	Lx/2fUa0XkP4AOiS4YkWFtx1/VAw0OZN1ywYf0nLTtjm15gyqR08X/Tkcig6fVLzPH1N
	bqejHmrH+h/3g0mCSibnm97oVAJj+cj6QMilxbR/2AJWfi0TwIEkLEBJWwdRWDULdk9E
	Ogr41XHgwDi+RzempxpeLXeDBLNjPR1w0UUQtbzUjrNynGmlbMn1c6/1hrWqGSeKj67u
	638Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=IBdXOuUdw6KN7MvoGlFCLjV3XFSwFd2K91d5YkiyaCA=;
	b=hkbQI1K6M0aMAUkzkilQKGmYkiTbjrAYe2Jcy1boo3jBQMy1OND9ldkCjO0I4enLuN
	a0KSB1lUOu57Nb88BYurq5YIj8NGmEzAE+3TW+SfgvFUdJwdztiTVP8zogXU3HdUzVDc
	DvOLMxdFef1DPNE3E0jyBA8uvvVFgX0Esljr61j6S0n5xkj2p1fTCed26DTpiUmAgdnd
	qj5gcY0dkyuQJ0FGqg/JKtiIdNR781FGAdAYAo2hL9JNuAle0kbgWIONCuWdPOYVCqKH
	VPsB18ZcQ+2Mo8bMZcHHYTUlJZY6pbn7L2DGAuuhJBCzipkvume4IffMrwHBs6NW/KXD
	6vgg==
X-Gm-Message-State: AMke39n/UH06KGqrC2rBs2nstNQtW7V5XSz1cgSWTaA4zbQucqbXPagyDAn2/6DDc5xMOxt6
X-Received: by 10.107.28.198 with SMTP id c189mr2904794ioc.198.1487858926123; 
	Thu, 23 Feb 2017 06:08:46 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59]) by smtp.gmail.com with ESMTPSA id
	v185sm1843674itf.11.2017.02.23.06.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 06:08:45 -0800 (PST)
Message-ID: <1487858923.11306.31.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Thu, 23 Feb 2017 15:08:43 +0100
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] wic: fix for #11017
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
X-List-Received-Date: Thu, 23 Feb 2017 14:14:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-21 at 17:23 +0200, Ed Bartosh wrote:
> This patchset improves handling of wic native tool dependencies and
> fixes minor bugs in the wic code.

I haven't tested it, but the patches themselves look good to me. Thanks!

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




