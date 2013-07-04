Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 623006AA07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:58:30 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-86-109.range86-137.btcentralplus.com
	[86.137.86.109]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4090E952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 12:58:31 +0100 (BST)
Message-ID: <51D56366.1080906@r-finger.com>
Date: Thu, 04 Jul 2013 12:58:30 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
	<CAJTo0LYa+ncg4fkiNewX2-Syo-7Lui2GDXpFuqLWOeyHBPk=MQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYa+ncg4fkiNewX2-Syo-7Lui2GDXpFuqLWOeyHBPk=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] xuser-account: create separate recipe for xuser creation
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
X-List-Received-Date: Thu, 04 Jul 2013 11:58:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/13 12:29, Burton, Ross wrote:
> On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> +USERADD_PARAM_${PN} = "--create-home \
>> +                       --groups video,tty,audio,input,shutdown \
>> +                       --user-group xuser"
> 
> I'm not liking the name "xuser" but unless someone has a much better
> idea right now we can change that later.

oeuser?

> Thinking about places where the xuser is used in other recipes (i.e.
> connman for ACLs), can anyone see a problem with adding xuser to the
> "users" group so those ACLS can use group membership instead of user
> name?

Yes, I think group would be preferred option.

Tomas

-- 
http://sleepfive.com

