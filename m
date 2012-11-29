Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1TdxPy-0004A2-E8
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 07:16:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT61vZt006840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Nov 2012 22:01:57 -0800 (PST)
Received: from [128.224.22.28] (128.224.22.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 28 Nov 2012 22:01:56 -0800
Message-ID: <50B6FA52.7070300@windriver.com>
Date: Thu, 29 Nov 2012 01:01:54 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Nicolas Dechesne <ndec13@gmail.com>
References: <CAOT3miKfftRKyBbPZCSmq=jKVx=pqRVLQtn-4azH_FbrmOqE4A@mail.gmail.com>
In-Reply-To: <CAOT3miKfftRKyBbPZCSmq=jKVx=pqRVLQtn-4azH_FbrmOqE4A@mail.gmail.com>
X-Originating-IP: [128.224.22.28]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Perl 'native' path
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
X-List-Received-Date: Thu, 29 Nov 2012 06:16:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-11-27 11:57 AM, Nicolas Dechesne wrote:
> hi,
>
> i am getting the following build error:
> ...
> i am trying to setup some daily builds on some corporate administrated
> machines... and what happens is that dpkg-scanpackage perl script has
> this:
>
> $ more sysroots/x86_64-linux/usr/bin/dpkg-scanpackages
> #!/usr/local/bin/perl
>
> So in turns my build will attempt to use whatever I have in
> /usr/local/bin (AFAIU), which is problematic in my case as this points
> to a corporate version (/apps/perl), which then leads to build
> failure.

Yes, it seems that dpkg-scanpackages needs to be fixed.

> I would expect all scripts to use the perl-native binary, instead, and
> search for Perl modules in the sysroot folder.
>
> does that make any sense?
Your explanation makes sense.

>is there something wrong with what I am
> doing (beyond using a corporate server which I can't administrate ;-)

I believe that using .debs in itself puts you in a less
tested environment; nonetheless, it should work.
Can you patch it?

Oh and I'm just curious, does an rpm system not work for you?

>
> thx
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

-- 
# Randy MacLeod


