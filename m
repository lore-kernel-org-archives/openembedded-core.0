Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwwmW-0002tn-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:53:44 +0200
Received: by qcad10 with SMTP id d10so5091480qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=trH+Z1mYGNxiHTSMtYVNh9xoZTGsFBI366TG1APCBNc=;
	b=ZQ3yPjmzrhZMuy+6szsaCsmF5EqoCefFriapiKa85xVHWzg0RViDhIKrwlLAiTXqwY
	6CH/p3j7asDwCijkC5c42omTlxKtu+2z24hs6aHvjoLOI7GY0rDvvHhieuAWVAb7iPIN
	4voT5sV9MDhcpNBouS997H2Df5NwQl6xYG3w997xmtvnaBGEIeuUL8LrwtRs7Z1uTh+e
	/7PUjkreYTIq4Ar8u+gEu7sw3+er1TnwHKWnzedu+O9BH1YkLjXQGIXtiYBRRhrIl5z8
	dMCNy0JPv3vj9HFZIquL0ddm0/2EIDwBu58Jbc2C7Ia53w3XyV3l4ZccdNdmWD6gaA2S
	G/FA==
MIME-Version: 1.0
Received: by 10.58.2.232 with SMTP id 8mr9427202vex.45.1343918524481; Thu, 02
	Aug 2012 07:42:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.90.203 with HTTP; Thu, 2 Aug 2012 07:42:04 -0700 (PDT)
In-Reply-To: <C0E6E020-9EA8-4B90-B6FA-A6B99121857C@gmail.com>
References: <20120802115012.GO16306@jama.jama.net>
	<1343909390-23651-1-git-send-email-Martin.Jansa@gmail.com>
	<C0E6E020-9EA8-4B90-B6FA-A6B99121857C@gmail.com>
Date: Thu, 2 Aug 2012 11:42:04 -0300
X-Google-Sender-Auth: 01GoFJEg-QauSayx6NFlCPga0I0
Message-ID: <CAP9ODKor75eZGVuAGw+EStyL1tCJO8M2tX4eDyP5ZguNTGV=qw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: fix regexp used when ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 11:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> It would be rather beneficial to import the u-boot patch to accommodate gold from meta-ti
> this helps in creating a uniform solution to same problem. u-boot patch should be upstreamed too.

I'll port this patch to U-Boot master and send it for inclusion.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


