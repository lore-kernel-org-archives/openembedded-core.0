Return-Path: <radu.moisan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A799621E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 08:32:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 01:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,987,1363158000"; d="scan'208";a="339784736"
Received: from ubuntu.rb.intel.com (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 01:32:46 -0700
Message-ID: <51D3E21D.8040306@intel.com>
Date: Wed, 03 Jul 2013 11:34:37 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1369298825.git.cazfi74@gmail.com>
	<519EA042.1@linux.intel.com>
	<CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
	<51D3DDED.7060804@intel.com>
	<CAF6bG8fVNGr+odjBEYhkgVRS+O=J9T9entPYikGz_uT53Y2g+Q@mail.gmail.com>
In-Reply-To: <CAF6bG8fVNGr+odjBEYhkgVRS+O=J9T9entPYikGz_uT53Y2g+Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Wed, 03 Jul 2013 08:32:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/03/2013 11:19 AM, Marko Lindqvist wrote:
> On 3 July 2013 11:16, Radu Moisan <radu.moisan@intel.com> wrote:
>> On 05/25/2013 01:21 AM, Marko Lindqvist wrote:
>>
>>
>>   Confirmed. Automake update to (any) 1.13.x version breaks gtk-engines
>> build. I don't know yet if it's automake or gtk-engines bug.
>>
>>
>> Any updates on this? Do we have a bug filled addressing this problem? I
>> found several package which require automake 1.13.x for upgrade and this
>> automake issue is blocking them.
>   Sorry I have had no time to work on this. I did file automake bug
> report, for which the response is
> http://lists.gnu.org/archive/html/bug-automake/2013-06/msg00014.html
> meaning we need to patch gtk-engines.
>

Thanks Marko, I'll take a look over this.

Radu

