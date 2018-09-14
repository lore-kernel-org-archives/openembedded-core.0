Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15B5B799D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 17:36:34 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id p84-v6so13546478oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 10:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=djhFM+s+qVXfs1hUvwDY1OG/4+hM1Glj2mVI/AAenh4=;
	b=ByQN4d/J/Ljbn8HzI2RdqnWHmPNeTYg+OpOSwnaY4SDrWdAutuxzSmsx6AgdjNRMmd
	n2IAq/meH4IXCfiz3mV2OcBhqJZffmuCTTlxOwfPVqEBKvAMgY0+3UJaTu4raxQ4NXyn
	ps49bYVkNC2+pXt4U7sc73Xj5gn8Aga5eGPBqhr24ebWywpdVOHN93Cz4IESn4cU4tP3
	JyscKq7HcvrDxRTIAetGADP2R/yuv5JLNY9sTQfi7TRq3ju/3iCvp9K5OnM4hTZfVUQZ
	IGlqENaCFXpcgoUnFnKiFM19uy4myUGBOwfu+DRzK9rjUVtA5IKY6E3XHGEuwfvl861d
	DyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=djhFM+s+qVXfs1hUvwDY1OG/4+hM1Glj2mVI/AAenh4=;
	b=JPfqm0duVIzCa/VAeW5JxXhxOE5cQuixfJwaCUFqdq3fXd/skTvDDZeUPWVmHdA9co
	n2EzwEWBXNqB/TpgoqYr678ahu+85kWRB6uKClnmGhWG+kHE1L1M/h1ZqQswjBlAzi3Y
	ciX8v5tfN6nXBXBTdGJoo2fGFSvuv+FaQzhvDH+RsVCKyjUkg/teFnFoNKnfhkbVrtRg
	wt8W6ikciGjIyIwIi+AmwkrrK8RHx5R+jSmpUj2gEVuL2oKyhAKvRLqqTnNqlwepWADP
	xf4Qb4YmeuL1o5rhOMz6/xqVWirH5X+x6fAEZu4fDP0FNGPfoNUpgwlFBD6562+5nv2b
	pBtA==
X-Gm-Message-State: APzg51ACiu1ciLjPW5W+O+cIZoyHXZeaxpSIDvEGjPMcyFfL3/AviUHq
	BPFQe4CVx53FYdVhkvxBkOVVg1ysq5dg6StOPXA=
X-Google-Smtp-Source: ANB0VdYqoJMtYnz4ZLl9T5+YcvgmtkWRAH5ze42FnLY6nYU5Xy1zsxXFkyBkZ6G91CWJ3E3wkC/PbO3s5Q29cIL4Zro=
X-Received: by 2002:aca:5d07:: with SMTP id
	r7-v6mr9464523oib.146.1536946596035; 
	Fri, 14 Sep 2018 10:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<d8c0d4fe-ae89-5b3d-0305-96820fd22141@xilinx.com>
	<CANNYZj9Mbpaf=gXupynTRvXiM1hPB4+pTsZ+0C+0fQVQkfomzg@mail.gmail.com>
In-Reply-To: <CANNYZj9Mbpaf=gXupynTRvXiM1hPB4+pTsZ+0C+0fQVQkfomzg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 14 Sep 2018 12:36:24 -0500
Message-ID: <CALLMt=qKHqgQqS3TUsxdHngk8sVRTN6scWEyVYtxxiTzfbDPPA@mail.gmail.com>
To: alex.kanavin@gmail.com
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 17:36:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 14, 2018 at 11:48 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> We should probably do another dig at ridding oe-core of py2 :)

Uh-oh!  Guess we better get the Py3 update on our list.

>
> Alex
>
> 2018-09-14 18:35 GMT+02:00 Alejandro Hernandez
> <alejandro.enedino.hernandez-samaniego@xilinx.com>:
> > Hey Ross,
> >
> >
> > I believe that if we want to go with this approach we would need to add
> > these packages as "special_packages" on the manifest script, that way the
> > script will simply avoid checking dependencies for them and will pass them
> > without modifications, this will also cause these packages to appear earlier
> > on the list, it does require some tweaking because directories such as
> > lib/python/email shouldnt be on the email package itself, so we would need
> > to take out such directories from the packages and rerun the script, that
> > will repopulate the email package (ad others) correctly  with the files
> > needed instead of the directory, but to be quite honest it might be easier
> > to go with the first approach and delete such files on do_install()
> >
> >
> > Cheers,
> >
> > Alejandro
> >
> >
> > On 9/13/2018 4:49 PM, Burton, Ross wrote:
> >>
> >> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
> >>>
> >>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
> >>> now and in the future.
> >>
> >> Gave this a go and annoyingly the manifest generation must sort the
> >> list because the glob works for everything apart from packages after
> >> tests alphabetically, so the tkinter and unittest tests don't get
> >> moved.
> >>
> >> I guess we could change the manifest to put the tests package at the
> >> top of the list, and be sure to respect the order when generating the
> >> lists.
> >>
> >> Ross
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

