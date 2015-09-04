Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 813D777038
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 14:16:38 +0000 (UTC)
Received: by iofh134 with SMTP id h134so25270972iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=j2AJOOvOJlXINmwiMmxzJlMXIUvi+n2QQ7P2Pplsg+8=;
	b=ndod65Fg54nVZgYKVOu8JQD9VRgTyxWW0EtJl22/fDidVRnnFbxfNBZ6U8mF953R84
	shdlUKglCDLnQ8nuqz278/yrqP9dAPFFvu2XTptCTyqUs/0ONiowE/ws/k6IQSMsaDOe
	rAmQvT9+lx+e97V64Xs2oB6xugYYXJloz0FwfRBOCKi9ydXxZWyt2KUMbRBlmAHmrPkZ
	d9xL4eBXEjZoshsOdWPqslNbcGbs5HOyY6lFgIvI28C6IxrKdBazCMhabHGu+so+uqts
	TCT8YiGdmFr9snEDmIf72qQ9SLPrIXBHrxqDVkSiy9/n8OhMtdTnz216j1DhJ8h5DhKY
	sXaQ==
MIME-Version: 1.0
X-Received: by 10.107.149.77 with SMTP id x74mr7248302iod.112.1441376199255;
	Fri, 04 Sep 2015 07:16:39 -0700 (PDT)
Received: by 10.107.162.202 with HTTP; Fri, 4 Sep 2015 07:16:39 -0700 (PDT)
In-Reply-To: <55E98B3B.4050704@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>
	<55E98B3B.4050704@linux.intel.com>
Date: Fri, 4 Sep 2015 07:16:39 -0700
Message-ID: <CAMKF1soR0r5ZVYYPnxGg0f+61oC2Cx6Mq0Y2390NXZzZn1-c4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 14:16:42 -0000
Content-Type: multipart/alternative; boundary=001a1140ff965829ee051eec8c90

--001a1140ff965829ee051eec8c90
Content-Type: text/plain; charset=UTF-8

On Friday, September 4, 2015, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 09/04/2015 12:28 AM, Khem Raj wrote:
>
> It is not used by anything in oe-core and will be moved to meta-gnome
>>>
>>>
>> OK, please send the patch for meta-gnome as well. So we can merge them in
>> more or less in sync
>>
>
> I will send these patches only when oe-core is updated. Recipe moving is
> always controversial, and I don't want to cause confusion when the change
> is accepted by one side and rejected by the other.


On the contrary you can make a note in patch to destination layer citing
the patch for source layer being a prerequisite to be accepted. Maintainers
then can schedule it accordingly.

>
> Alex
>
>

--001a1140ff965829ee051eec8c90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, September 4, 2015, Alexander Kanavin &lt;<a href=3D"mail=
to:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a>=
&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 09/04/2015 12:28 AM, Khem =
Raj wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
It is not used by anything in oe-core and will be moved to meta-gnome<br>
<br>
</blockquote>
<br>
OK, please send the patch for meta-gnome as well. So we can merge them in m=
ore or less in sync<br>
</blockquote>
<br>
I will send these patches only when oe-core is updated. Recipe moving is al=
ways controversial, and I don&#39;t want to cause confusion when the change=
 is accepted by one side and rejected by the other.</blockquote><div><br></=
div><div>On the contrary you can make a note in patch to destination layer =
citing the patch for source layer being a prerequisite to be accepted. Main=
tainers then can schedule it accordingly.=C2=A0=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Alex<br>
<br>
</blockquote>

--001a1140ff965829ee051eec8c90--
