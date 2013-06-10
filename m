Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3A82E61FD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 05:14:44 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 10so6974586pdi.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2013 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jffqahNqJ/nthcS+MsN6SwypTeQ3Lfjtz+NoNO6IeTk=;
	b=jvygtwumsHliIDj9tiaKare7VVzAEAer6Rd1V4YzNAQpGQj6XqAPz0Wg+aRQ2Xc4we
	mK2qM+yTkUwQE2kOFDEnuztaZsFgN1jcBP32KZ+seJxNqBwLs3RwjeIdaHOG9OQmyJiD
	GmyI2mvIch5TTLk9rqUGM+jUXQ5pKmKEiW08A7Ct8z3ACz7CNAJp0VGMUxnowmVcs1Uo
	sCszb02D3hdryetS0TLTFfA4nU+rOG2iGZv0F9y4ptYCtOFLcGSeVrp7VmOgL2qj31pj
	krcKYagTLD564OOlBJMmrdOW6Kz4v/Iu/ynE3ybp//lQW97IT9pYMNDnx4zNaTchUbtI
	Qjiw==
X-Received: by 10.66.51.165 with SMTP id l5mr12612712pao.73.1370841285008;
	Sun, 09 Jun 2013 22:14:45 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id 3sm8960376pbj.46.2013.06.09.22.14.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Jun 2013 22:14:44 -0700 (PDT)
Message-ID: <51B55F9F.3060104@gmail.com>
Date: Mon, 10 Jun 2013 15:09:51 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
	<14899581.O0scG6jzAS@helios>
	<CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
	<51B0EBE2.3020909@linux.intel.com>
	<3011112518438126591@unknownmsgid> <20130606233126.GF22710@jama>
In-Reply-To: <20130606233126.GF22710@jama>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Mon, 10 Jun 2013 05:14:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/06/2013 9:31 AM, Martin Jansa wrote:
> On Fri, Jun 07, 2013 at 09:17:09AM +1000, Jonathan Liu wrote:
>> On 07/06/2013, at 6:07 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>> On 06/06/2013 12:18 PM, Felipe Tonello wrote:
>>>> On Thu, Jun 6, 2013 at 2:54 AM, Paul Eggleton
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
>>>>>> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
>>>>>>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>>>>>>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>>>>>>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>>>>>>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>>>>>>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>>>>>>>>>> variables defined in qconfig.pri.
>>>>>>>>>>
>>>>>>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>>>>>>>>>> so that it can be located by qmake.
>>>>>>>>> There is such patch already:
>>>>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>>>>>>>>> 4.
>>>>>>>>> html
>>>>>>>> Got lost in my queue, adding it for the next MUT.
>>>>>>> FWIW I am still concerned by the assertion in the commit message about it
>>>>>>> causing undesirable behaviour. I'd want that checked out and the note
>>>>>>> removed before we look at merging this.
>>>>>> OK, I will shelf this until I hear more about the testing of this change
>>>>>> regarding the original patch's note.
>>>>> So I tested a rebuild of qt4-x11-free with Felipe's patch and two of
>>>>> Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty value" and
>>>>> "classes/qmake_base: allow parallel make"), and did not observe any unexpected
>>>>> behaviour and buildhistory looks clean for qt itself and fotowall/quicky. So
>>>>> I'd say feel free to throw these into MUT, but I think we need to drop the
>>>>> note.
>>>> Awesome.
>>> So can someone put a final updated patch series together.  I am still not sure about Jonathans's allow parallel make change, it seemed to have the -j option since it's added with a _prepend which is not overriden by the = assignment.
>>>
>>> Sau!
>> It has make -j 16 MAKEFLAGS=.
>> -j 16 adds to MAKEFLAGS, and MAKEFLAGS= clears it. It is trivial to
>> check this is the case and I have verified it both when building
>> fotowall and independently on command line for building Qt projects
>> outside of Yocto.
> disadvantage of this (at least in qt5) is that it starts independent
> make processes which all inherit MAKEFLAGS, so instead of 16 processes
> you can get a lot more - I've seen something like 40 when building
> qtwebkit with -j 8.
>
> But on other hand it's faster then -j1.
> https://github.com/meta-qt5/meta-qt5/commit/e9c61a9e6f51f500df349f8fe569ec095a1b8d2b
> https://github.com/meta-qt5/meta-qt5/commit/f76e45b5a8c59b1b8e4b806d2a2a09e6baf4d4e2
>
What about using make -j 16 -l 16?
This will prevent more make processes being created if the load average 
is 16 or higher.

Regards,
Jonathan

