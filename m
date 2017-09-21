Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 41984782A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 21:35:34 +0000 (UTC)
Received: (qmail 2911 invoked by uid 1003); 21 Sep 2017 21:35:36 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.111.57)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	21 Sep 2017 21:35:36 -0000
To: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
	<CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
	<20170918160610.GD17137@bill-the-cat>
	<a512c6ac-65d6-e105-8ce7-a2a387084dbe@denx.de>
From: Philip Balister <philip@balister.org>
Message-ID: <500e4bce-840a-cd83-ef77-015ea622cbbe@balister.org>
Date: Thu, 21 Sep 2017 17:35:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <a512c6ac-65d6-e105-8ce7-a2a387084dbe@denx.de>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Thu, 21 Sep 2017 21:35:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 09/19/2017 04:15 AM, Marek Vasut wrote:
> On 09/18/2017 06:06 PM, Tom Rini wrote:
>> On Mon, Sep 18, 2017 at 04:51:31PM +0100, Burton, Ross wrote:
>>> On 18 September 2017 at 16:46, Otavio Salvador <
>>> otavio.salvador@ossystems.com.br> wrote:
>>>
>>>> What is the policy on doing u-boot version upgrades this late in the
>>>>
>>>> release cycle? SHouldn't this wait until after the release?
>>>>
>>>>
>>>> Why?
>>>>
>>>> It is just another recipe and we are upgrading to the final release.
>>>>
>>>> As Martin said, it was already broken.
>>>>
>>>> I'll take the responsibility to fix it. But as other packages, upgrades
>>>> has risk and we have more than enough time to proper fix it.
>>>>
>>>
>>> Why?  Because it was merged to master after the freeze.
>>>
>>> Personally I'm of the opinion that u-boot is one of those special recipes
>>> that if an upgrade appears just after freeze, we consider it.  If we don't
>>> keep it up to date BSPs won't use the recipe, and we'll be back to every
>>> BSP layer containing its own special copy of the u-boot recipe.
>>
>> Also please note that U-Boot has a rather regular and public release
>> schedule: http://www.denx.de/wiki/U-Boot/ReleaseCycle so you can have a
>> good idea beforehand if you want to grab something for a release or not.
>>
>> Personally, I would like to see this in.  But the security issue that's
>> been disclosed now is "resolved" just by not enabling functionality that
>> no one was enabling in mainline, and will be removed in the next
>> release, so don't feel you need to pull it in on those grounds.
> 
> I agree that the 2017.09 upgrade is a good idea.
> 

OK, I just wanted to make sure everyone was on the same page about
timing of the update. We certainly don't want very many recipes to
decide they are special and take version bumps right up to release.

Philip



