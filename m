Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvAuF-0003PM-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 16:57:35 +0100
Received: by bwz10 with SMTP id 10so1204261bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 07:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T8kj22rk6Ryk/E7jddyOEZ3HcCwAzPmhqcPNX0nfYVE=;
	b=hOM/vA1RROKP5HDW2I6SG+cua7pnFMkLVbqcOUQqVND/2IRoiykO1WI1eNmxCakCDN
	QmgdXUnGugZ1s/xnA4tN/ZHwXbn0T20neFW9cOqs/GRgzPQc92BjJjHsmuQH80ZT/t1j
	4tghiT7mybCZ+zT+twkU1m6xO6pU+6PFRtEEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=omgytk/k18yVqQ1QVGfLJO4cqMXVOo2mrjK/jSkyz45YjBt9ttNyAITM38PEpkUiIa
	oEhF51bF5Y6gusfGSgw/SLxkUtFECn9vD8VJTrpZ8x84ruJ5gIUYukcnen4pOpoqckLW
	m1KO293uyq2TPh93QfTD5M6TiP+WWF++eU4mY=
Received: by 10.223.100.8 with SMTP id w8mr1687534fan.55.1299167696828; Thu,
	03 Mar 2011 07:54:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 07:53:23 -0800 (PST)
In-Reply-To: <394EA6D4-E718-4BE7-93A2-6AF67AAF6E0D@dominion.thruhere.net>
References: <394EA6D4-E718-4BE7-93A2-6AF67AAF6E0D@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 07:53:23 -0800
Message-ID: <AANLkTikgTx8SWJ1CpZgW=vgJYzrzveMsMMLUopHC57K8@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: lots of WARNING: QA Issue: Bit size did not match (32 to 0) warnings, what do they mean?
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
X-List-Received-Date: Thu, 03 Mar 2011 15:57:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2011 at 7:45 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> I started noticing a lot of warnings like this:
>
> WARNING: QA Issue: Bit size did not match (32 to 0) on /work/armv7a-angstrom-linux-gnueabi/udev-165-r2/packages-split/udev/sbin/udevd
>
> What do they mean and how can I (help to) fix them?
>

Its found due to f17c84c9b1cba52f860752058821b31930674e1a
probably can you post the binary so I can take a look
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


