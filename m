Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6BF36D73D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 16:15:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rABGFlPw008575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 08:15:47 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 08:15:47 -0800
Message-ID: <528102B3.4070301@windriver.com>
Date: Mon, 11 Nov 2013 10:15:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383974819.git.Qi.Chen@windriver.com>	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>	<1384038034.3798.46.camel@x121e.pbcl.net>	<52804662.1090605@windriver.com>
	<CAJTo0LZ3UVtckp+FV+_GC6y48L3XrU33W-xVTkH5AE9_E+Agcg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3UVtckp+FV+_GC6y48L3XrU33W-xVTkH5AE9_E+Agcg@mail.gmail.com>
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2013 16:15:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/13, 6:12 AM, Burton, Ross wrote:
> On 11 November 2013 02:52, ChenQi <Qi.Chen@windriver.com> wrote:
>> The problem here is that the init scripts under /etc/rcS.d/ need to execute
>> commands like awk, dirname, and readlink which are from /usr.
>
> Yes.  So why do you really need to support split /usr, and why isn't
> an initramfs a suitable alternative?  People seem to insist that split
> /usr is trivial but these patches are clearly showing it's not.

Just to be clear, I've never said it was trivial -- but what I have said is that 
it -should- be trivial if people pay attention to this stuff early.

The only thing that has to be done for the split is 'early boot'.  (See my email 
response to Phil..)

As for why, we still have people developing systems with small per-device memory 
that need to do the early boot from a small system, then mount the /usr 
partition from a shared location.  (/usr is often times still mounted RO.. and 
is shared between multiple CPUs within a single device or chasis.)

The usage of this is getting less and less, but we do still get issues from 
customers when things don't work right, so we know people are still doing it.

--Mark

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


