Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U4E3u-0005GT-BR
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 18:18:17 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so5068940oag.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BiWKTsC2nubugD8vtTYUw7wiXjGOiQqZ6OwjmUueRhY=;
	b=SEu3At1PCQ3mJPLdW/2g3VhQkfF3VrWUIOj5fsLamDoHozTkvdhIBhnNpdiia0Rd6/
	Vac821O4uhrJ/a7XB6pzUEEZhDNUmKz/mb5Xzs5PJkalp1i1QOXf4CR5ry9QeodpjV0w
	10x3aty9JdRy2jUZpzmwOcX0cD31rJzlGJV44jVgA4hG6UU2CUWFQ8hwX8dUipPk5CcO
	70xkEMdqhZJKYXiMOr6D63ecR9AjDRY2lVdXZ9iahkV0bxnev2Stv8G3BmqdQ31H9WJb
	7PZCSq6nzcpv/wO22zaN0l+5JW0ZFSE3POlJ54tYLfBZKjEZaDhYLLicZhzVqpDv/r2s
	zVOQ==
MIME-Version: 1.0
X-Received: by 10.182.38.69 with SMTP id e5mr6970664obk.79.1360429326409; Sat,
	09 Feb 2013 09:02:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 9 Feb 2013 09:02:06 -0800 (PST)
In-Reply-To: <51168084.3080902@linux.intel.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
	<fe2cc60ac93c64b7a6da42f876ff9befd1cf1938.1360362264.git.dvhart@linux.intel.com>
	<CAP9ODKpCZrabQt1s1=GHHhXm9s-GSMDgjq3965w8XQFka8-8ug@mail.gmail.com>
	<51168084.3080902@linux.intel.com>
Date: Sat, 9 Feb 2013 15:02:06 -0200
X-Google-Sender-Auth: GbcrY_GgMl3duLoSp9vgyKm2040
Message-ID: <CAP9ODKq0q-DXgeeehtJE_jJbMcNUuNhn5gzFR3m11e2Lmhp+mw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] oe-git-proxy: Add a new comprehensive git proxy script
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
X-List-Received-Date: Sat, 09 Feb 2013 17:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 9, 2013 at 2:59 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 02/08/2013 06:43 PM, Otavio Salvador wrote:
>> On Fri, Feb 8, 2013 at 8:27 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
>>> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
>>> ALL_PROXY to determine the proxy server, protocol, and port. It uses
>>> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
>>> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
>>> known to work with both bash and dash shells.
>>>
>>> V2: Implement recommendations by Enrico Scholz:
>>>     o Use exec for the nc calls
>>>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
>>>     o Use bash explicitly and simplify some of the string manipulations
>>>     Also:
>>>     o Drop the .sh in the name per Otavio Salvador
>>>     o Remove a stray debug statement
>>>
>>> V3: Implement recommendations by Otavio Salvador
>>>     o GPL license blurb
>>>     o Fix minor typo in comment block
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>>
>>> git-proxy cleanup
>>
>> All those comments ought to be bellow --- or those will be included in
>> commit log.
>>
>
> Which is fine.

Well, usually the log of the revisions are not included in the commit
logs; any special reason for it to be done different?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


