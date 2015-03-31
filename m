Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 05A9E73C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:18:31 +0000 (UTC)
Received: by iedm5 with SMTP id m5so26077001ied.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=f28goQovnM+kmg0nkm1x6pYUXFYaAUkG2nGkWb0c2lI=;
	b=WW0l9eqUNht9N+nC45j2z02E32JIHFZwYXUkKHAxHr2xn+xV3CN7R+V3XDTtDYMeyg
	mUBVPHWDVSH5WfwoSbFBU5r5Tckw6EUGe44DyLmMC0XaiI0t/uZD4XM6FxoWdk0XVN5L
	ucUgNVPZXZlePuKYghV0TwbDd18WKZ7b9PWIVm1c0ATzaRurlJgFjfqJN+WSTAoIJEEa
	xi/IbqaLHfVVfcQnJdQi1ppV3YnggK1hGN0slJ803mB6LEaS4P5A9jvd+2pQSlNxzoqK
	43UirZAv4ow8OHqotKCoFqauKmJfpLyx3rzegekKgK8JpH3qldZ3gaVFMmmEk99EZlyT
	NJ/g==
MIME-Version: 1.0
X-Received: by 10.50.79.163 with SMTP id k3mr7120972igx.30.1427833112061; Tue,
	31 Mar 2015 13:18:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Tue, 31 Mar 2015 13:18:31 -0700 (PDT)
In-Reply-To: <CAJTo0LY2H0-fUdBRuisL80V2wDDDYckMydSUmMyQ5MW9etic5w@mail.gmail.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org>
	<551AE604.6090804@windriver.com>
	<CAJTo0LY2H0-fUdBRuisL80V2wDDDYckMydSUmMyQ5MW9etic5w@mail.gmail.com>
Date: Tue, 31 Mar 2015 17:18:31 -0300
X-Google-Sender-Auth: sRCC3C8FsmdvJAv00_T83u9JbU4
Message-ID: <CAP9ODKp4yGh6CKUbtZf=r7RoCnvHBM_ZEhCJj5o6xFhuoGoJyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 20:18:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 31, 2015 at 5:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 31 March 2015 at 19:23, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> The easiest way to debug all of this is to edit
>> meta/classes/package.bbclass,
>> find the following lines:
>
> Or change the files that are chowned to exist somewhere else that doesn't
> get touched by fixup, like /testing/foo/bar.

This seems to be a design flaw. I understand we ought to have
somewhere to specify a default however the useradd class should
somehow instrument the code for those recipes to be able to override
this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

