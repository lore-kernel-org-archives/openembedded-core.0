Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Swwej-0002c8-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:45:41 +0200
Received: by vcbfy27 with SMTP id fy27so7735710vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=v7d33/Jijje2XeRrm9xG7nefGxKlffTrKbngWFl/ID4=;
	b=sZnD2Tgjj3DvCLkeCvB5N8aNNqioJEAbp8ap2VdZH880KSHglcWklsfB7Be1O/7911
	qZmrGHpovbIcKyUGJlkY9qwcTrhGvtRjYL1PTIlQ3hdQqvNS2TxmzikWKukORDpir8Fm
	PKyd4v0lMrs20ioed8KW669lJfyLwdG+yId5i5Ch4xASNbrGEsfApTqIBnaEDj3JxNkg
	CUxhyQ8dUFElg1mT9TbjefyWrW2iJApOP9gpvS/dhguYxaW0OqNPRUphQS/5gdhaMnSr
	07aZ2BqS1J8PtaVMtMu4ger+xSLzu15w63sKFs5VBSP7DbQI1NcSGYiEoqt/SZhqksyN
	fBEA==
MIME-Version: 1.0
Received: by 10.58.85.164 with SMTP id i4mr9369574vez.29.1343918041096; Thu,
	02 Aug 2012 07:34:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.90.203 with HTTP; Thu, 2 Aug 2012 07:34:01 -0700 (PDT)
In-Reply-To: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
References: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
Date: Thu, 2 Aug 2012 11:34:01 -0300
X-Google-Sender-Auth: p2l2-7_udFD3ZgKEpweofJLoxjM
Message-ID: <CAP9ODKqE8wVubidnsUAZUF+2+nmggGmiLTpLBygaZg05jL34Cw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] shadow-native: use 'users' group by default
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
X-List-Received-Date: Thu, 02 Aug 2012 14:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 23, 2012 at 2:37 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The rootfs has 'users' group at number 100 and without this fix it
> would assign to a non-existent group and if a group with gid as 1000
> is created later it would own all files for users created.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Can this be included on 1.2.2?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


