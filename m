Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TyPAw-0005Kv-Tj
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:57:16 +0100
Received: by mail-oa0-f42.google.com with SMTP id j1so10146385oag.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=N5YPukjDMK4ap13STmXQ0ogtnrm0DRG4bN02e3Nb2lk=;
	b=rY2afomZq9MK/11Ze9K4QvHLITPTHzLsKVlfJYXaYbxuuebm/fC7CSbf2n1KTK0yEd
	KabB2LXrX8HQqNaVgNWdbW7t7tpa23c4/SbNzShnYqQE9//ufMWFUlWosyXcY3Z5cB/N
	aX2f1JQWHrzpCO3mU/0bIJ0AqFGXgOgJiTv5QniFwsHcz2TjH7WT4VUP7qj/8TMWeoXK
	kFfowzUa11EDpHgCt1NI1gCoMRteRhccezxpuLqb8EVtDtV0KLGKOrVDGIF2yvvhrFBh
	UZTlEW0JebH0cvcJHfZAazZ6mCIicMT4KHcKqsKuSNHiUrbrHmAGB08Z4MW8IlEjpFRe
	rqDA==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr569257obk.72.1359042101542; Thu,
	24 Jan 2013 07:41:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Thu, 24 Jan 2013 07:41:41 -0800 (PST)
In-Reply-To: <20130124124319.GC3012@jama>
References: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
	<20130124124319.GC3012@jama>
Date: Thu, 24 Jan 2013 13:41:41 -0200
X-Google-Sender-Auth: lwAgCFxH3uA89dXbPhbLvNrrsO0
Message-ID: <CAP9ODKrR+OqtZc8-8OU9tW08xNp1u1DA5oWQDX5oza24DZvaGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Meta-web-kiosk Layer
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
X-List-Received-Date: Thu, 24 Jan 2013 15:57:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 24, 2013 at 10:43 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jan 24, 2013 at 12:05:00PM +0000, Ciobanu, Emilia Maria Silvia wrote:
>> Hi,
>>
>> I've created a new layer that can be used for kiosk devices.
>> You can check it out at:
>>     http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/
>>
>> It contains a new bitbake target that automatically
>> starts a web browser right after boot and enables the
>> use of a virtual keyboard if there is support for it.
>>
>> The layer currently includes recipes for the web browser,
>> and bsp configurations.
>>
>> I'm open to receiving feedback, patches and any suggestions.
>
> Why not add dependency on meta-openembedded/meta-oe and meta-gnome?
>
> At least 4 duplicated recipes could be removed and newer midori from
> meta-gnome would be used:
>
> OE @ ~/meta-openembedded $ find . -name ca-certificates_\*
> ./meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
> OE @ ~/meta-openembedded $ find . -name vala_\*
> ./meta-oe/recipes-devtools/vala/vala_0.16.0.bb
> OE @ ~/meta-openembedded $ find . -name midori_\*
> ./meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
> OE @ ~/meta-openembedded $ find . -name python-docutils_\*
> ./meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>
> Cheers,

Plus, it could be merged in meta-browser; I see no reason for another
layer for it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


