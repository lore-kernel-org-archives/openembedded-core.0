Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 03D826D3A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 05:22:42 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id C9F5C1C0266;
	Tue, 11 Jun 2019 17:22:42 +1200 (NZST)
To: Adrian Bunk <bunk@stusta.de>
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
	<73faa614-2438-4e1c-1cf9-d40fa5a60d52@windriver.com>
	<4e14116b-84ac-6138-33ca-4e01a311f866@taitradio.com>
	<9a6f595e-5e3c-f0c3-98b1-40472a15ed1b@windriver.com>
	<4fe2e513-e4f3-10f2-cda8-d34d14a66625@taitradio.com>
	<20190611045755.GA16835@localhost>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <2dfdd5cd-6ebf-83f3-6454-a19a594eed4f@taitradio.com>
Date: Tue, 11 Jun 2019 17:22:42 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611045755.GA16835@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 05:22:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 11/06/19 4:57 PM, Adrian Bunk wrote:

> On Tue, Jun 11, 2019 at 03:12:09PM +1200, Douglas Royds via Openembedde=
d-core wrote:
>> On 11/06/19 3:05 PM, Kang Kai wrote:
>>
>>> On 2019/6/11 =E4=B8=8A=E5=8D=8811:04, Douglas Royds wrote:
>>>> On 11/06/19 2:46 PM, Kang Kai wrote:
>> ...
>>>>> Use option '-M' of git format-patch may make the patch more
>>>>> clear. And why not just backport the 'disable-werror' commit?
>>>>
>>>> Re '-M': True, fair point.
>>>>
>>>> Re the backport: There hasn't been a release in over a year, they
>>>> don't seem to have any plans to do so (see
>>>> https://github.com/json-c/json-c/issues/487), and this was easier.
>>>> If you have a substantial objection, yes, I could submit it again
>>>> with a patch instead of the update.
>>> Just consider footprint, git repo will take more space than tar ball.
>>> But no substantial objection.
>>
>> We do also lose the RECIPE_UPSTREAM_VERSION functionality by switching=
 to
>> the git HEAD, ie. there'll be no notification when they do (eventually=
)
>> release a new version.
>>
>> I'm in two minds. Opinions?
> The biggest worry is actually whether some random git snapshot is as
> stable as a release.
>
> Unless there is a good reason why a git snapshot is better than
> release plus backported patch, the default should be to not switch
> to using a git snapshot.
>
> Starting to follow git snapshots brings the risk of frequent regression=
s
> since it follows the latest upstream development.


Fair enough, patch it is. Watch this space.


