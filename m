Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB6E62134;
	Thu,  9 Jun 2016 15:09:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2016 08:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="824901347"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2016 08:09:30 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 201AA6A4008; Thu,  9 Jun 2016 08:56:56 -0700 (PDT)
Received: from 10.7.198.51 (SquirrelMail authenticated user timothy.t.orling)
	by linux.intel.com with HTTP; Thu, 9 Jun 2016 08:56:55 -0700 (PDT)
Message-ID: <33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
Date: Thu, 9 Jun 2016 08:56:55 -0700 (PDT)
From: timothy.t.orling@linux.intel.com
To: "OpenEmbedded Devel List" <openembedded-devel@lists.openembedded.org>,
	"Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 15:09:33 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On 9 June 2016 at 15:08, Philip Balister <philip@balister.org> wrote:
>
>> That said, what other layers use vala? If it leaves core, is there a
>> layer that can host it and support other layers using it without to much
>> trouble?
>>
>
> That's the key question really - can the support be extracted and added to
> eg meta-vala in some way?
>
> Ross

I use vala for clutter/cogl/weston/wayland development, although not in
any published public layers. Part of me hates to see it leave core, but a
well maintained layer is acceptable-ish. I know that vala-terminal in
meta-oe has been in and out of blacklist for quite a while now.

Cheers.

--Tim

