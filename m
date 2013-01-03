Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TqsLH-0005IV-Qz
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 22:28:47 +0100
Received: by mail-ob0-f182.google.com with SMTP id 16so14129863obc.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 13:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SeCxwMsuqjbMoFTlJU7e6NAl+g9fiUtzGg5pbHTAejQ=;
	b=ArrS08L+XAkusKoN3VpJSvy7dQwROH9+6eO88KIJu6fRRtLkbDWO+Rmgg+20LXFN/s
	m13lGHDUpPW4/mw1KxuNkvHc0wbF9n2r3ib5BZOqCmnc2v8XdeF6yldZBZqIK7lzkzAI
	ByQJwDtsPUezuFt6TA5rm5WOV3nsp8I/h+0+zEPkV8dSbhENIjHn9yCrvliPJ1aZkow2
	hgFH1jjqI7VuBLGYu0R6gKuidAtVMMGCuw6ZV+eR534bZNVvayhg+Wi1321F+GqjKDom
	pARx1NfVL0zhd78uZDvvxsjobw1fJklqRW5IBWSSzqaatGAmwOzhoX3HePZGO9hCWn2z
	5t6Q==
MIME-Version: 1.0
Received: by 10.60.171.201 with SMTP id aw9mr28646787oec.126.1357247623137;
	Thu, 03 Jan 2013 13:13:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 3 Jan 2013 13:13:43 -0800 (PST)
In-Reply-To: <CABcZANkEoq6BpZ7YWPnD_QVpFym31DmWH+G6mBaFOnqqeO6SXg@mail.gmail.com>
References: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
	<CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
	<CAP9ODKoRytWOxAX3jn0nj12Jeah9mihobxd2PWaqApWA0ut9yQ@mail.gmail.com>
	<CABcZANkEoq6BpZ7YWPnD_QVpFym31DmWH+G6mBaFOnqqeO6SXg@mail.gmail.com>
Date: Thu, 3 Jan 2013 19:13:43 -0200
X-Google-Sender-Auth: p7fgS9EEujfWMR7lCv7YNoNmaSc
Message-ID: <CAP9ODKoiXA6jNavd=191nzZNGCHW2ygRfd-PnjoxoZt8bP7Ncw@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Jan 2013 21:28:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 2, 2013 at 3:11 PM, Christopher Larson
<chris_larson@mentor.com> wrote:
>
>
> On Wed, Jan 2, 2013 at 10:04 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Wed, Jan 2, 2013 at 12:51 PM, Christopher Larson
>> <chris_larson@mentor.com> wrote:
>> > On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad
>> > <muhammad_shakeel@mentor.com> wrote:
>> >>
>> >>  addtask do_archive_scripts_logs after do_package_write_rpm
>> >> +addtask do_archive_scripts_logs after do_package_write_ipk
>> >
>> >
>> > This will cause problems for anyone trying to do builds without
>> > package_ipk
>> > at all. I'd suggest using anonymous python to add the appropriate
>> > package
>> > dependencies based on what tasks actually exist.
>>
>> Uh? the only exception for it would be deb, right?
>
>
> Yes, and?

So the first patch changing from pre/post commands should be reworked
and solve it in the right way. I agree about the use of annonymous
python method for it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


