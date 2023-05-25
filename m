Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA729C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 15:58:20 +0000 (UTC)
Subject: Re: [PATCH 2/2] classes: Add new packagefeed class.
To: openembedded-core@lists.openembedded.org
From: "Charlie Johnston" <charlie.johnston@ni.com>
X-Originating-Location: Austin, Texas, US (162.237.205.80)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 May 2023 08:58:14 -0700
References: <773baf587feb68c4d83cbd8ce5f9fd6fef64998a.camel@linuxfoundation.org>
In-Reply-To: <773baf587feb68c4d83cbd8ce5f9fd6fef64998a.camel@linuxfoundation.org>
Message-ID: <29260.1685030294606767849@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yWO06b7WBxyMwzsz9ldp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 15:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181716

--yWO06b7WBxyMwzsz9ldp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I did not plan to add more currently. I liked this as it makes it clear the=
 intention of a specific packagegroup to represent a feed. I don't mind dro=
pping the class and just having our "packagefeed" packagegroups add the ext=
ra inherit.
For my own knowledge, what makes a class worthwhile? Is there an expectatio=
n that a bbclass has a certain amount of functionality to it?

Thanks,
Charlie

On Thu, May 25, 2023 at 05:52 AM, Richard Purdie wrote:

>=20
> On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:
>=20
>> Added a new packagefeed class that contains both a
>> packagegroup and the package index builds. This allows a
>> one-line bitbake for a packagegroup that defines a feed
>> without explicitly needing to run the package-index recipe.
>>=20
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>> meta/classes/packagefeed.bbclass | 5 +++++
>> 1 file changed, 5 insertions(+)
>> create mode 100644 meta/classes/packagefeed.bbclass
>>=20
>> diff --git a/meta/classes/packagefeed.bbclass
>> b/meta/classes/packagefeed.bbclass
>> new file mode 100644
>> index 0000000000..b83ac54f21
>> --- /dev/null
>> +++ b/meta/classes/packagefeed.bbclass
>> @@ -0,0 +1,5 @@
>> +#
>> +# Special case of packagegroup that includes package index builds.
>> +#
>> +
>> +inherit packagegroup package_index
>=20
> A new class with two inherits in it doesn't really seem worthwhile to
> me? Was there more you planned to add here?
>=20
> Cheers,
>=20
> Richard

--yWO06b7WBxyMwzsz9ldp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I did not plan to add more currently. I liked this as it makes it clear the=
 intention of a specific packagegroup to represent a feed. I don't mind dro=
pping the class and just having our "packagefeed" packagegroups add the ext=
ra inherit.<br />For my own knowledge, what makes a class worthwhile? Is th=
ere an expectation that a bbclass has a certain amount of functionality to =
it?<br /><br />Thanks,<br />Charlie<br /><br />On Thu, May 25, 2023 at 05:5=
2 AM, Richard Purdie wrote:<br />
<blockquote>On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:<br /=
>
<blockquote>Added a new packagefeed class that contains both a<br />package=
group and the package index builds. This allows a<br />one-line bitbake for=
 a packagegroup that defines a feed<br />without explicitly needing to run =
the package-index recipe.<br /><br />Signed-off-by: Charlie Johnston &lt;ch=
arlie.johnston@ni.com&gt;<br />---<br />meta/classes/packagefeed.bbclass | =
5 +++++<br />1 file changed, 5 insertions(+)<br />create mode 100644 meta/c=
lasses/packagefeed.bbclass<br /><br />diff --git a/meta/classes/packagefeed=
.bbclass b/meta/classes/packagefeed.bbclass<br />new file mode 100644<br />=
index 0000000000..b83ac54f21<br />--- /dev/null<br />+++ b/meta/classes/pac=
kagefeed.bbclass<br />@@ -0,0 +1,5 @@<br />+#<br />+# Special case of packa=
gegroup that includes package index builds.<br />+#<br />+<br />+inherit pa=
ckagegroup package_index</blockquote>
A new class with two inherits in it doesn't really seem worthwhile to<br />=
me? Was there more you planned to add here?<br /><br />Cheers,<br /><br />R=
ichard</blockquote>

--yWO06b7WBxyMwzsz9ldp--

