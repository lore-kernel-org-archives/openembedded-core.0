Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QaqxV-000311-Gz
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 17:09:13 +0200
Received: by pvf24 with SMTP id 24so2612180pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hVhqYwKj3Wnt9sKSLqW1Y51t8nZF+Y3PHOOBIjQYXGw=;
	b=nXRId04h1kLT7fCSO4kbkGU96wYTE0ysNtlxmYccZ5YgSiv1V+0WudYAszqozRFy4r
	2QMymdZNMhXmzg/LVj+QJlm8QI/C+th0MVQYo3z+BDh6Oe3rRGoaiY4C/pnmVJjlLAdE
	CO2pD9nRKAxcta+ZrCWUHcs1CHIYfI19F85AE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=qrHjbAqREJr71Vir8lY3LHNXnF8UNEADVYBJgpfaHJYhDl/Ytqs3D55F5vtH2MrIM3
	fkfQhFnvlVkSwF329pVy3fa0U6FsqlxhmWiXMX+EuDmuoGNSjYZVW1Pn4EBH5lHahROg
	zxOxGpJmuv4C8UKauuLzIX3bQsRvYa2QQMSA4=
Received: by 10.142.147.18 with SMTP id u18mr85163wfd.430.1309100733619;
	Sun, 26 Jun 2011 08:05:33 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t15sm3872130wfh.16.2011.06.26.08.05.32
	(version=SSLv3 cipher=OTHER); Sun, 26 Jun 2011 08:05:32 -0700 (PDT)
Message-ID: <4E074ABB.80405@gmail.com>
Date: Sun, 26 Jun 2011 08:05:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com>
In-Reply-To: <4E0699D1.9090308@gmail.com>
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Sun, 26 Jun 2011 15:09:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2011 07:30 PM, Khem Raj wrote:
> so in you kernel recipe somewhere patch the below code
>
> PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"

I guess it has 4.2.1 in the path for you as I see so you might need

PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel-4.2.1:"

-Khem


