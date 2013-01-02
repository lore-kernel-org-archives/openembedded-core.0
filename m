Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TqRyI-0001tZ-46
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 18:19:21 +0100
Received: by mail-oa0-f52.google.com with SMTP id o6so13393506oag.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 09:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=UcEpsVsX5RlDsW0IHO3rLMy1ylqKsQnUSGUXCihvE1g=;
	b=bv4q12On1m0nuA+VaJX95YuGjR+7x9oEBGj0Ihl0A6yLgnElpN1XhF1aZquNFh0OY0
	JS6tCip/A6JSvIdrsnLePMaqDXjUKWu/XTaQnPN+8gLq1N36XukYey0TdubEG+0pDth3
	S898ykpRDju2XmlIddQpmbhqIOpXsPm2TkszDDVy6xpXyAbKNqcYIMDs+V5yTgULX5cX
	FY7521aR9nyq5NTD5GtG3I+EsIFcOUu5MqbfvP9ad5wC/El921IZGjwZzftwCoUAs+Ky
	128qb93uxkfZKLrKBJPOhLvK72g+g8rgkwhR/iO7medQzVohu0gM7Aq9PBcw+hMLK7yo
	Zw5A==
MIME-Version: 1.0
Received: by 10.182.98.19 with SMTP id ee19mr37402850obb.90.1357146254922;
	Wed, 02 Jan 2013 09:04:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Wed, 2 Jan 2013 09:04:14 -0800 (PST)
In-Reply-To: <CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
References: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
	<CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
Date: Wed, 2 Jan 2013 15:04:14 -0200
X-Google-Sender-Auth: L1VbUe6OltDbA_c05t14_ZtU6TA
Message-ID: <CAP9ODKoRytWOxAX3jn0nj12Jeah9mihobxd2PWaqApWA0ut9yQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <chris_larson@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle package class 'package_ipk'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 17:19:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 2, 2013 at 12:51 PM, Christopher Larson
<chris_larson@mentor.com> wrote:
> On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad
> <muhammad_shakeel@mentor.com> wrote:
>>
>>  addtask do_archive_scripts_logs after do_package_write_rpm
>> +addtask do_archive_scripts_logs after do_package_write_ipk
>
>
> This will cause problems for anyone trying to do builds without package_ipk
> at all. I'd suggest using anonymous python to add the appropriate package
> dependencies based on what tasks actually exist.

Uh? the only exception for it would be deb, right?

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


