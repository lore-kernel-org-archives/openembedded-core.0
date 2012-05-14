Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SU3Ju-0006Ft-9m
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:00:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4ELojCC006827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 May 2012 14:50:45 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 14:50:44 -0700
Message-ID: <4FB17E33.5000408@windriver.com>
Date: Mon, 14 May 2012 16:50:43 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1spai-R74dMQZ00FooWwXmyLEdsN0HaPn_SArNPT1=Pa8g@mail.gmail.com>
In-Reply-To: <CAMKF1spai-R74dMQZ00FooWwXmyLEdsN0HaPn_SArNPT1=Pa8g@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
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
X-List-Received-Date: Mon, 14 May 2012 22:00:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/14/2012 04:33 PM, Khem Raj wrote:
> On Sun, May 13, 2012 at 7:28 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> I am not exactly sure how to fix this, so I thought I might ask in the
>> form of a working patch.  The problem is that I want to use an
>> external CCACHE_DIR on some build servers, but use the defaults on
>> others.  Ultimately the sstate sums should be the same in either case,
> hmmm so how do you ensure that both ccache stashes are exactly same ?

Why do they need to be the same?  

The end result of the compiler is the same with ccache, and that is all that matters in this case, meaning you get the same .o with "ccache gcc".  I might have several ccache directories with different sizes on different systems (it takes ~3.4 gigs for a full ccache).

CCACHE_DIR=/tmp/place1 ccache target-gcc ....
CCACHE_DIR=/tmp/place2 ccache target-gcc ....

Regardless of the state of the CCACHE_DIR the .o will be the same.

Jason.


