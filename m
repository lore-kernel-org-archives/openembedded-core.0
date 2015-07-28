Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 18244761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:21:16 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so70871036pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=71zH7zh90MpUyle0wjvt21KuxMjW4WSk/KcRDg1ueW4=;
	b=aKimCpagVmSdEZxmmq7Kcd+/+RsAxb9RFzVUYk8mNlzsM0J34Up7OOvIEU0XCYIg8v
	SYLJzvZcOnZAfLawBEhDe3z5QG3LoQSZai24EOSK4dB4wuwle+WlEWy2kbxLuJ6EGMHE
	pj8gKykeGHHgl0xQq8hTphrEz/fDMZwoQoO/BFYc595PDIPVytfTTWn7rtI+XmnIkUqK
	sUzMRlVO4Ux6NI6hxEW01Io6SSEvIZMQC+TUrZRd6jps7t6drsrv5q218z0dgLRguGHM
	hQ6xtganxwBYxzrgLIfWAqfLUwp8b4wxERIWcYGrLNWmb8FGAGJ9+H8PCMc/4BV7JGRu
	Yslg==
X-Gm-Message-State: ALoCoQlQaSdFUHAqMPwiOPcBoQCk5DhrXLQ6bQo4rAfMkvMJSTy2qqnKDl5AC0OhtHPZxJ2DnMZZ
X-Received: by 10.70.53.99 with SMTP id a3mr81803501pdp.169.1438089677035;
	Tue, 28 Jul 2015 06:21:17 -0700 (PDT)
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	o7sm35317624pdi.16.2015.07.28.06.21.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 06:21:16 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdrg1 with SMTP id g1so70889994pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:21:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.118.163 with SMTP id kn3mr63199042pdb.115.1438089674711; 
	Tue, 28 Jul 2015 06:21:14 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 28 Jul 2015 06:21:14 -0700 (PDT)
In-Reply-To: <55B77F87.5040401@pseudoterminal.org>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
	<1438106291-14986-3-git-send-email-b54851@freescale.com>
	<55B77F87.5040401@pseudoterminal.org>
Date: Tue, 28 Jul 2015 10:21:14 -0300
Message-ID: <CAP9ODKqiSX-gcrbnakHT2u8essxOr2ODt_=fVooXxCqE+xOY3A@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky v3][PATCH 2/6] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Tue, 28 Jul 2015 13:21:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 10:11 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Shouldn't the upstream status be "Submitted" instead of "Pending"? It is
> already in bugzilla.

Agreed. Submitted [https://...]

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

