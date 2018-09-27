Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77FD27990B;
	Thu, 27 Sep 2018 23:22:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8RNMV6h029078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2018 16:22:31 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Sep 2018 16:22:31 -0700
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, "Eggleton, Paul"
	<paul.eggleton@intel.com>
References: <1721109.tuLG3TFsTU@localhost.localdomain>
	<CAP71WjzUkYnazb3VHzEHgEDHoRqKdOT89Waw_hAy6pRyh8=BNA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <156dc277-4255-aaf3-cb9f-f25a4481189f@windriver.com>
Date: Thu, 27 Sep 2018 19:22:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjzUkYnazb3VHzEHgEDHoRqKdOT89Waw_hAy6pRyh8=BNA@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] layers.openembedded.org upgraded
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
X-List-Received-Date: Thu, 27 Sep 2018 23:22:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 09/27/2018 05:28 PM, Nicolas Dechesne wrote:
> On Thu, Sep 27, 2018 at 10:43 PM Paul Eggleton <paul.eggleton@intel.com> wrote:
>>
>> Hi all, >>
>> I'm very happy to announce that we've finally been able to upgrade the layer
>> index at http://layers.openembedded.org to the latest revision on master,
>> incorporating quite a bit of work that's been going on for the past few
>> months. Improvements now visible:

Nice new features, thanks!

The "Branch:" and "Filter layers" selection menus don't work
for me when using Firefox 62.0 (64-bit) on Ubuntu-18.04.

Google Chrome Version 69.0.3497.100 (Official Build) (64-bit)
works fine.

../Randy


>>
>> * Patch tracking - each recipe detail page now lists any patches being applied
>> by the recipe along with upstream status for each - see attached screenshot.
>> You can click through to view/download the actual patch, and any URLs in the
>> supplemental status text are also made into clickable links.
>>
>> * Source tracking - remote entries in SRC_URI are now listed on the recipe
>> detail page and made into clickable links where possible - see attached
>> screenshot
>>
>> * Link to inc files - there is now a link in the recipe detail page to any inc
>> files that a recipe includes as long as they are in the same directory, as a
>> shortcut to see the rest of the definitions for the recipe.
>>
>> * Recipe list CSV export - there is now an "Export CSV" button at the top of
>> the recipe list on the layer detail page. This currently includes the recipe
>> name and version - we could look at extending this, but note that the REST API
>> provides access to all of the information programmatically and may be better
>> suited for many applications that need this data.
>>
>> * Site-wide notice support - admins can now add notifications to appear at the
>> top of the page across the entire site. This is useful in the case where there
>> is some problem with the update process or maintenance is going on as happens
>> from time to time.
>>
>> * Bootstrap 3 - the UI has been updated to use Bootstrap 3 from version 2 that
>> we were using previously. This has made a fairly minor difference to the UI
>> (padding/spacing/fonts have changed a little) but has allowed us to tidy up a
>> few things in the code.
>>
>> * The "Base" layer type is no longer selectable for layer submissions. I
>> noticed people sometimes selected this erroneously; it's only applicable for
>> openembedded-core and meta-oe basically so that they show up at the top of the
>> layer list. Only admins can now select this type for a layer.
>>
>> * Numerous other bugfixes, robustness improvements and code cleanups.
>>
>> Thanks very much to everyone who has contributed to the layer index code up to
>> now (and to BitBake / tinfoil, which we rely upon to extract the information
>> from the metadata), but I'd like to give particular thanks to Michael
>> Halstead, Yi Zhao, Konrad Scherer, Robert Yang and Aníbal Limón for making
>> this upgrade possible.
> 
> Paul, and everyone above, many thanks for your contributions to the
> Layer Index which is definitely a great tool for our community! It
> encourages and simplifies reuse and sharing of all recipes! The update
> looks really good, and as Andreas says, the top #3 features will make
> a big difference.
> 
>>
>>
>> Also integrated were the Recipe Reporting System (RRS) which powers
>> http://recipes.yoctoproject.org and other distro comparison support, but these
>> will take a bit more time to properly enable so I'll send out a separate email
>> with further details when they are ready.
>>
>> As always, please let me know if you have any comments or notice any issues.
>> (I've already seen a few minor problems in the update logs so I'll be looking
>> into those.)
>>
>> Cheers,
>> Paul
>>
>> --
>> Paul Eggleton
>> Intel Open Source Technology Centre--
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto


-- 
# Randy MacLeod
# Wind River Linux

