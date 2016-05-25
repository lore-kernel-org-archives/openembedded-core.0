Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id F059B601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 14:24:22 +0000 (UTC)
Received: (qmail 16394 invoked by uid 1003); 25 May 2016 14:24:22 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.118.32)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	25 May 2016 14:24:22 -0000
To: alexander.kanavin@linux.intel.com
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
	<9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
	<51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <534a7be7-380a-1d4a-085b-0ce503d59542@balister.org>
Date: Wed, 25 May 2016 10:24:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 28/45] swig: move to Python 3
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
X-List-Received-Date: Wed, 25 May 2016 14:24:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/25/2016 08:45 AM, alexander.kanavin@linux.intel.com wrote:
>> I'm trying to get my head around how this change will impact python2
>> based programs that use swig, such as gnuradio.
>>
>> Does this mean all programs that use swig will need to move to python3
>> now?
> 
> Probably. At least nothing in meta-oe or oe-core was impacted by this, as
> far as I see, but if GNU radio isn't building properly anymore, then
> copy-paste the error, and we'll work out a solution.

I did a quick read of the swig manual and it seems that swig built for
python3 will generate code that runs with both.

It would be nice to use PACKAGECONFIG to select 2 versus 3 so we can
build sdks that only have python2.

Philip

> 
> Alex
> 
> 

