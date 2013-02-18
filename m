Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U7aem-0000SL-9G
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 01:02:08 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so6068227obb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 15:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JmoHUqz0QZK2T8/hGzlZ7W0Eb3rgejCVMKuR97xeVSM=;
	b=haV/Pgc0x7U0a/M5mxLF6fw6iEUATq8uj6Frkghld7Dbxpu/9dO49FNFPoJXiEOVUg
	t8dQ0mE+rdJzRnyHbojUNIDThJ/0FX8GwpYLBdwlSf63mCyS5KrR6PwwqNiHHXU9ia50
	Y41JEaNnZ2WWHcOudA6F1dRQLeID8ANMpPBYil8quPp/Dddc5g0PZow7QZkozfbWbYTV
	b//ObRKgM3oRI9Rpbk7VTW05wDUAR32E4EoiqlnAhfF8ELqOMXuLwYPp/tZi5vGo4qjD
	4rzUq76a+dvZvQiR/Xibv9mg8TLu+IqVa9ME4AapwKE56r5t8qqv+AmbjDuU3OsnQFgv
	d/xw==
MIME-Version: 1.0
X-Received: by 10.60.20.7 with SMTP id j7mr6872522oee.40.1361231151332; Mon,
	18 Feb 2013 15:45:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 18 Feb 2013 15:45:51 -0800 (PST)
In-Reply-To: <1361229968-9068-1-git-send-email-Martin.Jansa@gmail.com>
References: <1361229968-9068-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 18 Feb 2013 20:45:51 -0300
X-Google-Sender-Auth: ufeC6SVLOq6ahiXqzS2RLDxXo6o
Message-ID: <CAP9ODKrn_Ptmhz7-t5uMprxQBt8DzH5ERKbWy=BGv6gA0cJRuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] sanity: use lsb distro_identifier
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
X-List-Received-Date: Tue, 19 Feb 2013 00:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 18, 2013 at 8:26 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * distro_identifier returns lsb_data['Distributor ID']-lsb_data['Release']
>   which in some cases is different then lsb_release -d -s, e.g.
>   Distributor ID: Ubuntu
>   Description:    Ubuntu 12.04 LTS
>   Release:        12.04
>   Codename:       precise
>   But we probably don't need to sanity list each point release in LTS
>   and sstate is already using distro_identifier as prefix for native
>   sstate archives
> * This will need update to SANITY_TESTED_DISTROS (at least
>   s/Ubuntu 12.04 LTS/Ubuntu-12.04/g etc), that's why sending as RFC
>   first.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

It makes sense for me. It easy the maintainence of the tested distros list.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


