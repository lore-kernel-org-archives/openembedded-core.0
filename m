Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwwhA-0002gR-GX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:48:12 +0200
Received: by qaat11 with SMTP id t11so1591290qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=qV8g5mZBj56TZOEEhwdCZH0YZYfZ8jvBya/dEZ3QHmg=;
	b=XwraZM1iSX/OLldFCkzGj1LHiWGZXhmaUtohkHz7CRBZ/Md3Q7NEWdkeuT/Y4nT29a
	fom+uub/Aq8alh1NLN2iv+vtWF0D3Xk1dhzYSkUvaf7fF8wfgW+K7YJFLMiLOGGEa/aU
	PDbiY3JTZQJs2R7/Zpl+1Al5+NWC+kVq2nYBeei932uicWHhUrgIyAlNbTTQnYn6yxMx
	JUAUCn/uG3EPzeiN7fiP1hqw2kssOGW9JlFTiulyK+7yq89nVVdn4zGoLeRsV1AXFICB
	+vI/597hsX9xpU6+qs3NK5MiVEspz7izAYtfnw7MKxU4tzwfV7FsoI1jZxsi0av2CtyM
	6F6w==
MIME-Version: 1.0
Received: by 10.58.211.68 with SMTP id na4mr9431547vec.38.1343918192538; Thu,
	02 Aug 2012 07:36:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.90.203 with HTTP; Thu, 2 Aug 2012 07:36:32 -0700 (PDT)
In-Reply-To: <1343065037-13851-2-git-send-email-otavio@ossystems.com.br>
References: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
	<1343065037-13851-2-git-send-email-otavio@ossystems.com.br>
Date: Thu, 2 Aug 2012 11:36:32 -0300
X-Google-Sender-Auth: qgz-vyd3VYGCXGdXtq5A6uDwY3c
Message-ID: <CAP9ODKqJBnmDShNAhSiSfuGrPuPHZ-kY_GD9WtdU7JRyDqEPjw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] shadow: use 'users' group by default
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
X-List-Received-Date: Thu, 02 Aug 2012 14:48:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 23, 2012 at 2:37 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The rootfs has 'users' group at number 100 and without this fix it
> would assign to a non-existent group and if a group with gid as 1000
> is created later it would own all files for users created.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Can it be included on 1.2.2?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


