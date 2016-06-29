Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id DF68D60043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 22:47:05 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id j3so86261995vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=j0h/qQwnxnrbhI6OYtl+zZQlmWl2CnS3/jj4aOMNr3c=;
	b=vvDp4hoZaNRYgIdHnH2VpsmrisF73+cbr3izOvUofBSTTLKQHJZPzRGY5+uZbg2lsr
	PtHbPI6ordXD7KQQl7AYqh9ISVWloqYXtZ31ia4HuLqGoVztAPKkl0zDWzGF6MKoA8u7
	YODvJmvr9sbyVoVIhdKlezqxDdS+zV7ARD4qB5xrr5/8G0vTBYjRU5EaHG+gULfB1hz9
	rMGMO3zEaLeaxC+Xo3bu/NljUyeLP4DVdq1lvCDJtXM872xXx6YwYxrMUIIpDM6RBaqx
	H45Iw4TSn+cR3ogooT6/S9IlDEMz0mEqSO8y9ZRq93sXBfHxqozbw04/nEWikyFxFM88
	PvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=j0h/qQwnxnrbhI6OYtl+zZQlmWl2CnS3/jj4aOMNr3c=;
	b=M4mWfhKv0EVJAKJHpp9+lGcrFog9Os2KBjB3g8CyVIEaMaVBpwO0F33v5ntq3WDS6F
	jG6Cqb8JDvZGlF5pCl6FkNrGjWq90ALM2XOq7/k71DaVSEb2P0SRvkYTnhC6oljxSIdH
	4+4XXtN/mrDa1ExD1gAHMXdV3DfWAvj/IgG0/R5Nx7qwdczWLD2uIVYm2K67dnRAan5n
	gJ+lHq8zknYxMcsqbACiu9PnxbciiI5vfC4C+E1/6Au/LEVEzNVp+JsNa1ARDkRvrUbV
	Y7qGrmZTSXjsUsnacsuJlnUWVH1KZA/a8t31vJh4cbyN8YoFQ1SHiIi0kBne1ROSbC0o
	XAYg==
X-Gm-Message-State: ALyK8tK6L3M9UxcaBC8tPbAkkw1bAioAf8t3e6xpI1iZFIyNs+gUOaO5DolsA1sXn+FbnYAzHaK6ht7tkO4i0Q==
MIME-Version: 1.0
X-Received: by 10.176.0.146 with SMTP id 18mr4916649uaj.17.1467240425874; Wed,
	29 Jun 2016 15:47:05 -0700 (PDT)
Received: by 10.103.35.80 with HTTP; Wed, 29 Jun 2016 15:47:05 -0700 (PDT)
Received: by 10.103.35.80 with HTTP; Wed, 29 Jun 2016 15:47:05 -0700 (PDT)
In-Reply-To: <1467215048.2888.43.camel@intel.com>
References: <20160629031255.3551-1-li.zhou@windriver.com>
	<1467181987.8590.105.camel@linuxfoundation.org>
	<1467215048.2888.43.camel@intel.com>
Date: Wed, 29 Jun 2016 16:47:05 -0600
Message-ID: <CACS+7ZTjDFw--YRTNae6pEbPaqTbysD021zY2LDD9sqqCOvf8A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Bill Randle <william.c.randle@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: correct the multilib support patch
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
X-List-Received-Date: Wed, 29 Jun 2016 22:47:10 -0000
Content-Type: multipart/alternative; boundary=001a114678e8626dfd0536728833

--001a114678e8626dfd0536728833
Content-Type: text/plain; charset=UTF-8

On 29 Jun 2016 9:44 a.m., "Randle, William C" <william.c.randle@intel.com>
wrote:
>
> On Wed, 2016-06-29 at 07:33 +0100, Richard Purdie wrote:
>>
>> On Wed, 2016-06-29 at 11:12 +0800, Li Zhou wrote:
>>>
>>> When python3 rebased its multilib patch, the hard coded "lib" path
>>> isn't really changed because of the rebasing's error, and cause
>>> phthon3's failure when running on 64bit platforms as below:
>>> Could not find platform independent libraries <prefix>
>>> Could not find platform dependent libraries <exec_prefix>
>>> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>>> Fatal Python error: Py_Initialize: Unable to get the locale encoding
>>> ImportError: No module named 'encodings'
>>>
>>> Here correct the rebasing error and solve this issue.
>>>
>>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>> ---
>>>  ...ython3-correct-the-multilib-support-patch.patch | 47
>>> ++++++++++++++++++++++
>>>  meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
>>>  2 files changed, 48 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/python/python3/0001-python3
>>> -correct-the-multilib-support-patch.patch
>>
>>
>>
>> Don't we want to correct the "bad" patch rather than adding an
>> additional patch? Or did I misunderstand the problem?
>>
>> Also, are there some automated tests we should be adding to catch this
>> kind of problem? I'm a little worried none of our testing caught this.
>>
>> Cheers,
>>
>> Richard
>
>
> I would agree that since the original patch has not been accepted
upstream,  it would make the most sense to just regenerate it.
>
> In addition, there are a couple of other places in getpath.c that have a
hard coded "lib/". Have you verified those are correct as is? (I.e., ~line
706 'L:lib/pyhton00.zip"' and ~line 718 'L"lib/lib-dynload"'. Seems like
the second case should use code similar other palces lib-dynload is used in
the file that uses lib_python to build the path.)
>
>     -Bill

Fedora and others have similar patches. Have people checked them out?

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114678e8626dfd0536728833
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 29 Jun 2016 9:44 a.m., &quot;Randle, William C&quot; &lt;=
<a href=3D"mailto:william.c.randle@intel.com">william.c.randle@intel.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 2016-06-29 at 07:33 +0100, Richard Purdie wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 2016-06-29 at 11:12 +0800, Li Zhou wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; When python3 rebased its multilib patch, the hard coded &quot;=
lib&quot; path<br>
&gt;&gt;&gt; isn&#39;t really changed because of the rebasing&#39;s error, =
and cause<br>
&gt;&gt;&gt; phthon3&#39;s failure when running on 64bit platforms as below=
:<br>
&gt;&gt;&gt; Could not find platform independent libraries &lt;prefix&gt;<b=
r>
&gt;&gt;&gt; Could not find platform dependent libraries &lt;exec_prefix&gt=
;<br>
&gt;&gt;&gt; Consider setting $PYTHONHOME to &lt;prefix&gt;[:&lt;exec_prefi=
x&gt;]<br>
&gt;&gt;&gt; Fatal Python error: Py_Initialize: Unable to get the locale en=
coding<br>
&gt;&gt;&gt; ImportError: No module named &#39;encodings&#39;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Here correct the rebasing error and solve this issue.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver=
.com">li.zhou@windriver.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 ...ython3-correct-the-multilib-support-patch.patch | 47<=
br>
&gt;&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3_3=
.5.1.bb">python3_3.5.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt;&gt;=C2=A0 2 files changed, 48 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/=
0001-python3<br>
&gt;&gt;&gt; -correct-the-multilib-support-patch.patch<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Don&#39;t we want to correct the &quot;bad&quot; patch rather than=
 adding an<br>
&gt;&gt; additional patch? Or did I misunderstand the problem?<br>
&gt;&gt;<br>
&gt;&gt; Also, are there some automated tests we should be adding to catch =
this<br>
&gt;&gt; kind of problem? I&#39;m a little worried none of our testing caug=
ht this.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt; I would agree that since the original patch has not been accepted upst=
ream, =C2=A0it would make the most sense to just regenerate it.<br>
&gt;<br>
&gt; In addition, there are a couple of other places in getpath.c that have=
 a hard coded &quot;lib/&quot;. Have you verified those are correct as is? =
(I.e., ~line 706 &#39;L:lib/pyhton00.zip&quot;&#39; and ~line 718 &#39;L&qu=
ot;lib/lib-dynload&quot;&#39;. Seems like the second case should use code s=
imilar other palces lib-dynload is used in the file that uses lib_python to=
 build the path.)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 -Bill</p>
<p dir=3D"ltr">Fedora and others have similar patches. Have people checked =
them out?</p>
<p dir=3D"ltr">&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
&gt;<br>
</p>

--001a114678e8626dfd0536728833--
