Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 723C371ABC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 20:29:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u40so693255wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DpISFrKaqouEZ7cMzCJSEMur2ZXEInxmpjI9y5q4lqM=;
	b=BnudtX51YG3xYh5O/aczmD2jFHNw9S8+FKlfxabI2KRwpU5aYIwNvIcwLjgSqVjqn4
	rxX8kuE0keRw4vQgAxvlUe+0Axut2NySEpKfIODBPc79j6SAi7T22UFiTOmTYHgAx5a+
	KpMsns574tmMEiN5x0wSyuUn8eGDzvWsQg142DbxRAYM+CXj9Uh8WvCl+s3uvhEDWx3w
	urRjFituKLLOPjL+xDTcDg8T08CiV2XLpHu1Knz1Le7btKhPYTHGVinVKoqOxfW/39Db
	cn0SOAySbrz9eELPoDZqWPYRjs8jEfNqBs8ngvpJVWBgwCowGvGMvX4lKh9wIv94jXhX
	A+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DpISFrKaqouEZ7cMzCJSEMur2ZXEInxmpjI9y5q4lqM=;
	b=HJM/GBDfA38aeh6s+BMGqlbBGzzlR5JsZC3XRDFm9wxk/Ksvqy/phx+V6rtup2tAaq
	wfqCPCrfX+xVQvLNuZJT/Ent2gBmWkbElLtfda85Ty+l56dnY5DmEXEYxG1BzKgm1xeK
	9/lnfm+hnIwVlHxsZyB73PV8RdrySB1t9EBIfER+ArKNKRPkk3QEtHB+x3gdWG8SVMCG
	PKGy47DmlRtrBbxbvqWsF8NdWMAd5iimLJiI/EyU+Y9vfUFIfCRoG3eGxGz4ji4Pgztk
	8k2yBl5awrOTmAAc5ik/LM269SWeXxkjCziR+/2wXS3T3sjnE0bTjdubWWW++l1WoUhS
	wb2g==
X-Gm-Message-State: AMCzsaXIgrLwzM3JsEzZA42NP5n/42R9S0l6Nogo7DURKsGYTkgr1HE4
	y8BFsW3hupU/lOxDJflJlyot01PSP8Mri6sdWbE=
X-Google-Smtp-Source: ABhQp+RZ7bdQngFEeF9qyYWbclGGRWMvtllvDAL4Xpiegb3nVJpwanDHsQ7caBTGsIFkGhtRimKSNyXtrq8NVeE6+ps=
X-Received: by 10.223.146.197 with SMTP id 63mr3746878wrn.180.1509654545177;
	Thu, 02 Nov 2017 13:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 2 Nov 2017 13:29:04 -0700 (PDT)
In-Reply-To: <59F846E4.3050003@windriver.com>
References: <1509440578-173066-1-git-send-email-zhixiong.chi@windriver.com>
	<4903a7b3-5039-9b7c-9372-37f10d555b9c@linux.intel.com>
	<59F846E4.3050003@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Nov 2017 13:29:04 -0700
Message-ID: <CAJ86T=UnT5woKyTFC82_O0kycoqPufavbOvduRXy4_9F0hWS4Q@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: CVE-2017-13089 and CVE-2017-13090
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
X-List-Received-Date: Thu, 02 Nov 2017 20:29:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 2:48 AM, Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
> On 2017=E5=B9=B410=E6=9C=8831=E6=97=A5 17:13, Alexander Kanavin wrote:
>> On 10/31/2017 11:02 AM, Zhixiong Chi wrote:
>>>
>>> Patches from:
>>>
>>> http://git.savannah.gnu.org/cgit/wget.git/patch/?id=3Dd892291fb8ace4c3b=
734ea5125770989c215df3f
>>> http://git.savannah.gnu.org/cgit/wget.git/patch/?id=3Dba6b44f6745b14dce=
414761a8e4b35d31b176bba
>>>
>>> CVE: CVE-2017-13089 CVE-2017-13090
>>
>> Update the master to 1.19.2 instead please.

Patching 1.19.1 does have the advantage of creating a commit which can
easily be cherry-picked into rocko (and pyro, which also uses wget
1.19.1).

Master should certainly update to 1.19.2 but doing so in two steps
might be appreciated by the stable branch maintainers.

