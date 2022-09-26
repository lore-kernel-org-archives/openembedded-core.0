Return-Path: <robert_henz@jabil.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E235C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 15:49:39 +0000 (UTC)
Subject: Re: PR to fix WantedBy parsing of systemctl
To: openembedded-core@lists.openembedded.org
From: "Robert Henz" <robert_henz@jabil.com>
X-Originating-Location: Versailles, Kentucky, US (217.180.201.84)
X-Originating-Platform: Linux Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 08:49:36 -0700
References: <Yyouc28ZITHHQlcp@mail.local>
In-Reply-To: <Yyouc28ZITHHQlcp@mail.local>
Message-ID: <18402.1664207376148460909@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="ZQi0hVFQEz3pc8VkDFyl"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 15:49:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171068

--ZQi0hVFQEz3pc8VkDFyl
Content-Type: multipart/alternative; boundary="JwsPY2YKYlPukIAIlXK7"

--JwsPY2YKYlPukIAIlXK7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 05:19 PM, Alexandre Belloni wrote:

>=20
> Hello,
>=20
> On 20/09/2022 17:55:42+0000, Robert Henz via lists.openembedded.org wrote=
:
>=20
>=20
>> Hi everyone,
>>=20
>> I have a PR to fix the WantedBy parsing of the systemctl script. I
>> tried to follow the process described in your wiki
>> ( https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedde=
d ),
>>=20
>> but ran into some problems I wasn't able to figure out. I will attach
>> the patch file for my suggested change to this email but I also went
>> ahead and created a fork and generated a GitHub PR in case that is
>> ok/easier?
>=20
> This is not easier to me. However, I'm interested to know more about the
> issues you couldn't solve as this is a recurring topic.

I am following the instructions (https://www.openembedded.org/wiki/How_to_s=
ubmit_a_patch_to_OpenEmbedded#Sending_via_a_pull_request) under "Sending vi=
a a pull request".
I created a github fork (cloned it, created my commit and pushed it back to=
 a branch of my forked repo).

The problem I've run into is this:

```

bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u badge=
r
NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.
NOTE: Assuming local branch HEAD, use -l to override.
fatal: unable to connect to github.com:
github.com[0: 140.82.114.4]: errno=3DConnection timed out

warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at=
 git://github.com/BadgerTechnologies/openembedded-core
warn: Are you sure you pushed 'fix-wantedby-clearing' there?
ERROR: git request-pull reported an error
bobhenz@hound:~/src/openembedded-core$ git log
commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 (HEAD -> fix-wantedby-clear=
ing, badger/fix-wantedby-clearing)
Author: Bob Henz <robert_henz@jabil.com>
Date:=C2=A0=C2=A0 Mon Sep 19 22:02:58 2022 -0400

Fix WantedBy processing

An empty string assignment to WantedBy should clear all prior WantedBy
settings. This matches behavior of the current systemd implementation.

Signed-off-by: Bob Henz <robert_henz@jabil.com>

commit 68b07bb7f0f01925f9da1cb966239ee49d5c84e3 (origin/master, origin/HEAD=
, badger/master, master)
Author: He Zhe <zhe.he@windriver.com>
Date:=C2=A0=C2=A0 Mon Sep 26 16:08:07 2022 +0800

lttng-tools: Disable on qemuriscv32

lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on
riscv32. This has been confirmed by lttng-tools upstream.
https://github.com/lttng/lttng-tools/pull/162

It's also turned off for riscv32 in meta-riscv.
https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
```

(As you can see from the git log, that commit was pushed to the remote fork=
ed repo called "badger".)

>=20
>=20
>> From 6cdb207ed99bc82324fb7b85126425ac8d439070 Mon Sep 17 00:00:00 2001
>> From: Bob Henz <robert_henz@jabil.com>
>> Date: Mon, 19 Sep 2022 22:02:58 -0400
>> Subject: [PATCH] Fix WantedBy processing
>>=20
>> An empty string assignment to WantedBy should clear all prior WantedBy
>> settings. This matches behavior of the current systemd implementation.
>=20
> Your SoB is missing here and this is mandatory.

I will attach a new patch with a SoB. Can you explain the value of having m=
e sign off on my own PR? I guess I thought someone with more authority woul=
d be signing off on the change...

Thanks for your guidance

--JwsPY2YKYlPukIAIlXK7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 05:19 PM, Alexandre Belloni wrote:<br />
<blockquote>Hello,<br /><br />On 20/09/2022 17:55:42+0000, Robert Henz via =
lists.openembedded.org wrote:<br />
<blockquote>Hi everyone,<br /><br />I have a PR to fix the WantedBy parsing=
 of the systemctl script. I<br />tried to follow the process described in y=
our wiki<br />(<a href=3D"https://www.openembedded.org/wiki/How_to_submit_a=
_patch_to_OpenEmbedded" target=3D"_blank" rel=3D"noopener">https://www.open=
embedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a>),<br />but ran =
into some problems I wasn't able to figure out. I will attach<br />the patc=
h file for my suggested change to this email but I also went<br />ahead and=
 created a fork and generated a GitHub PR in case that is<br />ok/easier?</=
blockquote>
This is not easier to me. However, I'm interested to know more about the<br=
 />issues you couldn't solve as this is a recurring topic.</blockquote>
<p>I am following the instructions (https://www.openembedded.org/wiki/How_t=
o_submit_a_patch_to_OpenEmbedded#Sending_via_a_pull_request) under "Sending=
 via a pull request".<br />I created a github fork (cloned it, created my c=
ommit and pushed it back to a branch of my forked repo).<br /><br />The pro=
blem I've run into is this:</p>
<p>```</p>
<p>bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u ba=
dger<br />NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to o=
verride.<br />NOTE: Assuming local branch HEAD, use -l to override.<br />fa=
tal: unable to connect to github.com:<br />github.com[0: 140.82.114.4]: err=
no=3DConnection timed out<br /><br />warn: No match for commit b637a46f58b5=
adc7dcc76bdef90a7be8c8462df8 found at git://github.com/BadgerTechnologies/o=
penembedded-core<br />warn: Are you sure you pushed 'fix-wantedby-clearing'=
 there?<br />ERROR: git request-pull reported an error<br />bobhenz@hound:~=
/src/openembedded-core$ git log<br />commit b637a46f58b5adc7dcc76bdef90a7be=
8c8462df8 (HEAD -&gt; fix-wantedby-clearing, badger/fix-wantedby-clearing)<=
br />Author: Bob Henz &lt;robert_henz@jabil.com&gt;<br />Date:&nbsp;&nbsp; =
Mon Sep 19 22:02:58 2022 -0400<br /><br />&nbsp;&nbsp;&nbsp; Fix WantedBy p=
rocessing<br />&nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; An empty string =
assignment to WantedBy should clear all prior WantedBy<br />&nbsp;&nbsp;&nb=
sp; settings. This matches behavior of the current systemd implementation.<=
br />&nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; Signed-off-by: Bob Henz &l=
t;robert_henz@jabil.com&gt;<br /><br />commit 68b07bb7f0f01925f9da1cb966239=
ee49d5c84e3 (origin/master, origin/HEAD, badger/master, master)<br />Author=
: He Zhe &lt;zhe.he@windriver.com&gt;<br />Date:&nbsp;&nbsp; Mon Sep 26 16:=
08:07 2022 +0800<br /><br />&nbsp;&nbsp;&nbsp; lttng-tools: Disable on qemu=
riscv32<br />&nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; lttng-tools requir=
es SYS_ppoll and SYS_pselect6 which are not supported on<br />&nbsp;&nbsp;&=
nbsp; riscv32. This has been confirmed by lttng-tools upstream.<br />&nbsp;=
&nbsp;&nbsp; https://github.com/lttng/lttng-tools/pull/162<br />&nbsp;&nbsp=
; &nbsp;<br />&nbsp;&nbsp;&nbsp; It's also turned off for riscv32 in meta-r=
iscv.<br />&nbsp;&nbsp;&nbsp; https://github.com/riscv/meta-riscv/blob/mast=
er/conf/layer.conf<br />&nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; Signed-=
off-by: He Zhe &lt;zhe.he@windriver.com&gt;<br />&nbsp;&nbsp;&nbsp; Signed-=
off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />```<=
br /><br />(As you can see from the git log, that commit was pushed to the =
remote forked repo called "badger".)<br /><br /></p>
<blockquote>
<blockquote>From 6cdb207ed99bc82324fb7b85126425ac8d439070 Mon Sep 17 00:00:=
00 2001<br />From: Bob Henz &lt;robert_henz@jabil.com&gt;<br />Date: Mon, 1=
9 Sep 2022 22:02:58 -0400<br />Subject: [PATCH] Fix WantedBy processing<br =
/><br />An empty string assignment to WantedBy should clear all prior Wante=
dBy<br />settings. This matches behavior of the current systemd implementat=
ion.</blockquote>
Your SoB is missing here and this is mandatory.</blockquote>
I will attach a new patch with a SoB. Can you explain the value of having m=
e sign off on my own PR? I guess I thought someone with more authority woul=
d be signing off on the change...<br /><br />Thanks for your guidance

--JwsPY2YKYlPukIAIlXK7--

--ZQi0hVFQEz3pc8VkDFyl
Content-Type: text/x-patch; name="0001-Fix-WantedBy-processing.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-Fix-WantedBy-processing.patch"

RnJvbSBiNjM3YTQ2ZjU4YjVhZGM3ZGNjNzZiZGVmOTBhN2JlOGM4NDYyZGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCb2IgSGVueiA8cm9iZXJ0X2hlbnpAamFiaWwuY29tPgpEYXRl
OiBNb24sIDE5IFNlcCAyMDIyIDIyOjAyOjU4IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gRml4IFdh
bnRlZEJ5IHByb2Nlc3NpbmcKCkFuIGVtcHR5IHN0cmluZyBhc3NpZ25tZW50IHRvIFdhbnRlZEJ5
IHNob3VsZCBjbGVhciBhbGwgcHJpb3IgV2FudGVkQnkKc2V0dGluZ3MuIFRoaXMgbWF0Y2hlcyBi
ZWhhdmlvciBvZiB0aGUgY3VycmVudCBzeXN0ZW1kIGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9m
Zi1ieTogQm9iIEhlbnogPHJvYmVydF9oZW56QGphYmlsLmNvbT4KLS0tCiBtZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bCB8IDExICsrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXN5c3RlbWN0bC9zeXN0ZW1jdGwKaW5kZXggNmQxOTY2
NmQ4Mi4uY2RkYWU3NWEwNiAxMDA3NTUKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLXN5c3RlbWN0bC9zeXN0ZW1jdGwKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLXN5c3RlbWN0bC9zeXN0ZW1jdGwKQEAgLTI2LDYgKzI2LDkgQEAgbG9jYXRpb25z
ID0gbGlzdCgpCiAKIGNsYXNzIFN5c3RlbWRGaWxlKCk6CiAgICAgIiIiQ2xhc3MgcmVwcmVzZW50
aW5nIGEgc2luZ2xlIHN5c3RlbWQgY29uZmlndXJhdGlvbiBmaWxlIiIiCisKKyAgICBfY2xlYXJh
YmxlX2tleXMgPSBbJ1dhbnRlZEJ5J10KKwogICAgIGRlZiBfX2luaXRfXyhzZWxmLCByb290LCBw
YXRoLCBpbnN0YW5jZV91bml0X25hbWUpOgogICAgICAgICBzZWxmLnNlY3Rpb25zID0gZGljdCgp
CiAgICAgICAgIHNlbGYuX3BhcnNlKHJvb3QsIHBhdGgpCkBAIC04MCw2ICs4MywxNCBAQCBjbGFz
cyBTeXN0ZW1kRmlsZSgpOgogICAgICAgICAgICAgICAgIHYgPSBtLmdyb3VwKCd2YWx1ZScpCiAg
ICAgICAgICAgICAgICAgaWYgayBub3QgaW4gc2VjdGlvbjoKICAgICAgICAgICAgICAgICAgICAg
c2VjdGlvbltrXSA9IGxpc3QoKQorCisgICAgICAgICAgICAgICAgIyBJZiB3ZSBjb21lIGFjcm9z
cyBhICJrZXk9IiBsaW5lIGZvciBhICJjbGVhcmFibGUga2V5IiwgdGhlbgorICAgICAgICAgICAg
ICAgICMgZm9yZ2V0IGFsbCBwcmVjZWRpbmcgYXNzaWdubWVudHMuIFRoaXMgd29ya3MgYmVjYXVz
ZSB3ZSBhcmUKKyAgICAgICAgICAgICAgICAjIHByb2Nlc3NpbmcgZmlsZXMgaW4gY29ycmVjdCBw
YXJzZSBvcmRlci4KKyAgICAgICAgICAgICAgICBpZiBrIGluIHNlbGYuX2NsZWFyYWJsZV9rZXlz
IGFuZCBub3QgdjoKKyAgICAgICAgICAgICAgICAgICAgZGVsIHNlY3Rpb25ba10KKyAgICAgICAg
ICAgICAgICAgICAgY29udGludWUKKwogICAgICAgICAgICAgICAgIHNlY3Rpb25ba10uZXh0ZW5k
KHYuc3BsaXQoKSkKIAogICAgIGRlZiBnZXQoc2VsZiwgc2VjdGlvbiwgcHJvcCk6Ci0tIAoyLjI1
LjEKCg==

--ZQi0hVFQEz3pc8VkDFyl--

