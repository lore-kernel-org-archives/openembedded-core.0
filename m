Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id DFE7861963
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2013 17:21:25 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id j10so2040871qcx.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2013 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lgx8ShZkwyszFTcYKuZO2eUB0p6ThrNJORgVFcSsCtY=;
	b=bOrWGRdYPZtfkj/JwZY0v8N72o+GCQvoAhecP4iwjbYR1ui3f6ItNsvLA9XdOkdYa1
	90Wn7JGXTOlb+EeCogaLFA2fbk60F7hZk+b+Dz5Cz5AfJknoCd4NZrnplw9V94jq+UeC
	0Cy4nC7TTD1UQdvquigKqGc4urQBgCiFHlZ4ihhAahn071FT+6W60dy/4anSOFzivBX6
	nxgpOZm5r0MqiU2cf8KXCp7bk5QpemnIlZw0u2nAsu+vfkRIDxPByisBJgtvI2RVt+Cl
	E5pZy3/DrGK//pFz+KFBjiuNB2eG8KzqmYsGunZgRVLuf3wMlvAn8BIMj+QJinT/m4Da
	weMg==
MIME-Version: 1.0
X-Received: by 10.224.65.3 with SMTP id g3mr9965841qai.42.1376846486136; Sun,
	18 Aug 2013 10:21:26 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Sun, 18 Aug 2013 10:21:26 -0700 (PDT)
In-Reply-To: <51D3E21D.8040306@intel.com>
References: <cover.1369298825.git.cazfi74@gmail.com>
	<519EA042.1@linux.intel.com>
	<CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
	<51D3DDED.7060804@intel.com>
	<CAF6bG8fVNGr+odjBEYhkgVRS+O=J9T9entPYikGz_uT53Y2g+Q@mail.gmail.com>
	<51D3E21D.8040306@intel.com>
Date: Sun, 18 Aug 2013 20:21:26 +0300
Message-ID: <CAF6bG8e8Gknoetdd2teB66_Jykp1SGjqC8z=ZH+sjtK9bdjQVw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
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
X-List-Received-Date: Sun, 18 Aug 2013 17:21:26 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 11:34, Radu Moisan <radu.moisan@intel.com> wrote:
>
> On 07/03/2013 11:19 AM, Marko Lindqvist wrote:
>>
>> On 3 July 2013 11:16, Radu Moisan <radu.moisan@intel.com> wrote:
>>>
>>> On 05/25/2013 01:21 AM, Marko Lindqvist wrote:
>>>
>>>
>>>   Confirmed. Automake update to (any) 1.13.x version breaks gtk-engines
>>> build. I don't know yet if it's automake or gtk-engines bug.
>>>
>>>
>>> Any updates on this? Do we have a bug filled addressing this problem? I
>>> found several package which require automake 1.13.x for upgrade and this
>>> automake issue is blocking them.
>>
>>   Sorry I have had no time to work on this. I did file automake bug
>> report, for which the response is
>> http://lists.gnu.org/archive/html/bug-automake/2013-06/msg00014.html
>> meaning we need to patch gtk-engines.
>>
>
> Thanks Marko, I'll take a look over this.
>
> Radu

 What's the status now? I see that at least automake has not been
updated yet. I could take a look myself next week.


 - ML

