Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SSNtv-0003lF-79
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 09:35:03 +0200
Received: by wgbdr1 with SMTP id dr1so923469wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 00:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=e9cISZKVI6BcXYza1MDWUn1zMnqMKqDAnigbmXWRQLE=;
	b=S5taKi1mbVn26LSQXrt+Dsbub75gGFvXYojPztZ1a86iDwSfqRTuhdl3OP7EkNR5Rs
	v2jKmoiI8wW7DZ/aox4VAtEjKDWTk+vASp7dNu1kvcuBR/zQU+pnlzwZj7juItdcg16U
	8Km62LAbVcJKNLzShuJUPUCxoWDzsT+xYlVisXRFX5OMlUvpQdDb7AJU77KiNZMqsLw8
	i4vfA7B8GIfJGhXQ4f/dMyyh4QlVPMXF4mP6ik5o5WnovmLV/+62Paosxa7FJs2fUfYT
	1H/N5esGNssjuW68RKbJbHOW89UuZTzO3H2JUNB9i2UkPfy7TzzHjTAZSBi9fpl6RJKL
	9ktw==
Received: by 10.180.83.196 with SMTP id s4mr6826880wiy.15.1336634709495;
	Thu, 10 May 2012 00:25:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm2479719wib.2.2012.05.10.00.25.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 00:25:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
Date: Thu, 10 May 2012 09:25:05 +0200
Message-Id: <08CD538A-B50C-4EBD-BC47-9A71486AD712@dominion.thruhere.net>
References: <cover.1336608479.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnj9hUTuu9RQWjFLr04SfQDbc/1ubxoFxuEsqdXSapP+9jrTF3/yvvzAw8eP2BK9f9gEjz2
Subject: Re: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 07:35:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2012, om 02:22 heeft Joshua Lock het volgende geschreven:

> This is an RFC series, and for ease of review sent as against the Poky =
tree

It requires an extra step to apply and thus makes review harder for me =
since my motivation to test them drops below zero. Please send patches =
to bitbake and oe-core to this list and reserve poky patches for the =
poky list.
As for ease of review by glancing over them: 3 emails are 3 emails.=


