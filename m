Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA7073190
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 18:20:47 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w20so5928093qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VmL76BdYnqxGvPh1aTO3EnjrHMM0F55p/n+n82M83zk=;
	b=lDgAydE1k3j+/cxi/ODbgbTBGbtes1EYpUuEKMIvfFZF2yiec6zKyyg/o+vV8tkKmW
	O60JEGv+Jjmr2ig7p/fajbfDU9b/13Yuo/fImVy5dbGl34vgQ3t13VuLJ7gc1g96dOj4
	38Y4SsZ4qaxwD+kmk1v+HCGvj3TTQi02wKPiVwrZoOi4hzh3zJQ+AiMc5I9oM/5defqh
	9h75euVH40ra204DYIlC3Gb8EGcihfp2YLQgn0LpuPX+vJM/HSW935D1TAnd/x7mWYej
	GCOJ/AdTMw++celXUG6ID31/QGdz1rVpFnUoiSN6qUlOzW1fC4mSiIVrPfpFwSI2/YBT
	bF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VmL76BdYnqxGvPh1aTO3EnjrHMM0F55p/n+n82M83zk=;
	b=lw9rF9/ebB+4KAy5zllt5si2GKpRGudogJ6h45UjGEzjUm3ELNCmPJCdkyYWOJz2KZ
	2DpKegZL5EMv2yBQIcFajmb412wNA4lMFrj8OTTWlmS/r7b/y4fESPYrhEERmnFTD8l1
	YQjN2hyFJVJKKu5/1Zep2I5E12bN4ZJzqP0sxhKxnP1ZN/ci9siDRAaPIlCGNwmRuBN2
	tkTPuK28N8up0MJdBu7oQXd3geOrapggPX9Tdv7PuQzbubwtLciZk1PjKHo1lfvxsWpb
	NACfizcd8wCRgBfX2mjn3ltKaYmBLjokiw+O5GB6jwniGZrVH70mqurE2nOUeqQWedRh
	Nm8Q==
X-Gm-Message-State: AIkVDXJES5OV5izBxoNyupzJtxGRp/TfrPDho8W1xxg9/aLJyciBCM/OiLROH9iSQLGUqL1EwRdFbIVuILO2+g==
X-Received: by 10.237.56.68 with SMTP id j62mr8431808qte.185.1486146048289;
	Fri, 03 Feb 2017 10:20:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 3 Feb 2017 10:20:47 -0800 (PST)
In-Reply-To: <CADkTA4PUAoTG+apRuhRYiv9xgcH++gp7QKOke5dScidVhB1d6g@mail.gmail.com>
References: <1486118977-42065-1-git-send-email-awais_belal@mentor.com>
	<CADkTA4PUAoTG+apRuhRYiv9xgcH++gp7QKOke5dScidVhB1d6g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Feb 2017 13:20:47 -0500
Message-ID: <CADkTA4Oic31VzZtcSz7nq_Loq0SYh8+LmvPCOB44Y-Gabs-xig@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching when HEAD is checked out
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
X-List-Received-Date: Fri, 03 Feb 2017 18:20:48 -0000
X-Groupsio-MsgNum: 92847
Content-Type: multipart/mixed; boundary=001a1137ac144b24a40547a45746

--001a1137ac144b24a40547a45746
Content-Type: multipart/alternative; boundary=001a1137ac144b249f0547a45744

--001a1137ac144b249f0547a45744
Content-Type: text/plain; charset=UTF-8

Here's the patch that I came up with based on your change. The only
difference
is that I modified the patching script to have a --clean option .. and used
that
instead. That way we keep the internals hidden.

If this works for you, I can send it in my next kernel pull request.

Bruce

On Fri, Feb 3, 2017 at 9:16 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Feb 3, 2017 at 5:49 AM, Awais Belal <awais_belal@mentor.com>
> wrote:
>
>> In some cases it is seen that kernel_checkout and
>> validate_branches are run again in simultaneous builds.
>> During do_patch the kgit-s2q mechanism creates and
>> checks for the kgit-s2q.last file inside the .git
>> directory, finds a fence post and starts picking up
>> patches after that. This can create trouble as
>> validate_branches checks out the HEAD of the branch
>> and so the patches should be reapplied rather than
>> skipped due to finding of the fence post.
>>
>
> Indeed. I can see how this could happen. I added the mechanism to ensure
> that multiple runs (forced or not) didn't re-patch the tree (since the
> tools no
> longer do an auto-resume detection).
>
> At that time, I tried to run the paths and make sure that the sentinel file
> couldn't cause this sort of problem, but clearly there is a case.
>
> I'll grab this patch and modify it a bit so the script can clear the file
> itself
> (that way if the format changes again, we don't have to tweak the bbclass).
>
> I'll float that patch by you, if that is ok, so you can add a
> Signed-off-by
> (since the work on finding the issue deserves credit on the patch itself).
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/
>> kernel-yocto.bbclass
>> index 5cfd8af..131c48a 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -350,6 +350,10 @@ do_validate_branches() {
>>                         current_branch=`git rev-parse --abbrev-ref HEAD`
>>                         git branch "$current_branch-orig"
>>                         git reset --hard ${force_srcrev}
>> +                       # We've checked out HEAD, make sure we cleanup
>> kgit-s2q fence post check
>> +                       # so the patches are applied as expected
>> otherwise no patching
>> +                       # would be done in some corner cases.
>> +                       rm -rf ${S}/.git/kgit-s2q.last
>>                 fi
>>         fi
>>  }
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137ac144b249f0547a45744
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Here&#39;s the patch that I came up wi=
th based on your change. The only difference<br></div>is that I modified th=
e patching script to have a --clean option .. and used that<br></div>instea=
d. That way we keep the internals hidden.<br><br></div>If this works for yo=
u, I can send it in my next kernel pull request.<br><br></div>Bruce<br></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 3, =
2017 at 9:16 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bru=
ce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Fri,=
 Feb 3, 2017 at 5:49 AM, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:awais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">In some cases it is seen th=
at kernel_checkout and<br>
validate_branches are run again in simultaneous builds.<br>
During do_patch the kgit-s2q mechanism creates and<br>
checks for the kgit-s2q.last file inside the .git<br>
directory, finds a fence post and starts picking up<br>
patches after that. This can create trouble as<br>
validate_branches checks out the HEAD of the branch<br>
and so the patches should be reapplied rather than<br>
skipped due to finding of the fence post.<br></blockquote><div><br></div></=
span><div>Indeed. I can see how this could happen. I added the mechanism to=
 ensure<br></div><div>that multiple runs (forced or not) didn&#39;t re-patc=
h the tree (since the tools no<br></div><div>longer do an auto-resume detec=
tion).<br><br></div><div>At that time, I tried to run the paths and make su=
re that the sentinel file<br></div><div>couldn&#39;t cause this sort of pro=
blem, but clearly there is a case.<br><br></div><div>I&#39;ll grab this pat=
ch and modify it a bit so the script can clear the file itself<br></div><di=
v>(that way if the format changes again, we don&#39;t have to tweak the bbc=
lass).<br><br></div><div>I&#39;ll float that patch by you, if that is ok, s=
o you can add a Signed-off-by <br></div><div>(since the work on finding the=
 issue deserves credit on the patch itself).<br><br></div><div>Cheers,<br><=
br></div><div>Bruce<br></div><div><div class=3D"h5"><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com" ta=
rget=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbc<wbr>lass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D"_bla=
nk">kernel-yocto.bb</a><wbr>class b/meta/classes/<a href=3D"http://kernel-y=
octo.bb" target=3D"_blank">kernel-yocto.bb</a><wbr>class<br>
index 5cfd8af..131c48a 100644<br>
--- a/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D"_blank">ker=
nel-yocto.bb</a><wbr>class<br>
+++ b/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D"_blank">ker=
nel-yocto.bb</a><wbr>class<br>
@@ -350,6 +350,10 @@ do_validate_branches() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 current_branch=3D`git rev-parse --abbrev-ref HEAD`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git branch &quot;$current_branch-orig&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git reset --hard ${force_srcrev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# We&#39;ve checked out HEAD, make sure we cleanup kgit-s2q fence=
 post check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# so the patches are applied as expected otherwise no patching<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# would be done in some corner cases.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm -rf ${S}/.git/kgit-s2q.last<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<span class=3D"m_3647062007783465811m_6164858625079764098HOEnZb"><font colo=
r=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div></div></div><span class=3D"HOEnZb"><font c=
olor=3D"#888888"><br><br clear=3D"all"><br>-- <br><div class=3D"m_364706200=
7783465811m_6164858625079764098gmail_signature" data-smartmail=3D"gmail_sig=
nature">&quot;Thou shalt not follow the NULL pointer, for chaos and madness=
 await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div>

--001a1137ac144b249f0547a45744--

--001a1137ac144b24a40547a45746
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-kernel-yocto.bbclass-ensure-repatching-when-HEAD-is-.patch"
Content-Disposition: attachment; 
	filename="0001-kernel-yocto.bbclass-ensure-repatching-when-HEAD-is-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iyq4zbtv0

RnJvbSBjZTc1ODdmNDQ0ZDY1MmJkOWJjY2MxMDY0ZmFhMjM4OWQ3OTgyNTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBd2FpcyBCZWxhbCA8YXdhaXNfYmVsYWxAbWVudG9yLmNvbT4K
RGF0ZTogRnJpLCAzIEZlYiAyMDE3IDE1OjQ5OjM2ICswNTAwClN1YmplY3Q6IFtQQVRDSF0ga2Vy
bmVsLXlvY3RvLmJiY2xhc3M6IGVuc3VyZSByZXBhdGNoaW5nIHdoZW4gSEVBRCBpcyBjaGVja2Vk
CiBvdXQKCkluIHNvbWUgY2FzZXMgaXQgaXMgc2VlbiB0aGF0IGtlcm5lbF9jaGVja291dCBhbmQg
dmFsaWRhdGVfYnJhbmNoZXMgYXJlCnJ1biBhZ2FpbiBpbiBzaW11bHRhbmVvdXMgYnVpbGRzLiBE
dXJpbmcgZG9fcGF0Y2ggdGhlIGtnaXQtczJxIG1lY2hhbmlzbQpsb29rcyBmb3IgYSBzZW50aW5l
bCBmaWxlIGluc2lkZSB0aGUgLmdpdCBkaXJlY3RvcnksIGZpbmRzIGEgZmVuY2UgcG9zdAphbmQg
c3RhcnRzIHBpY2tpbmcgdXAgcGF0Y2hlcyBhZnRlciB0aGF0LgoKVGhpcyBjYW4gY3JlYXRlIHRy
b3VibGUgYXMgdmFsaWRhdGVfYnJhbmNoZXMgY2hlY2tzIG91dCB0aGUgSEVBRCBvZiB0aGUKYnJh
bmNoIGFuZCBzbyB0aGUgcGF0Y2hlcyBzaG91bGQgYmUgcmVhcHBsaWVkIHJhdGhlciB0aGFuIHNr
aXBwZWQgZHVlIHRvCmZpbmRpbmcgb2YgdGhlIGZlbmNlIHBvc3QuCgpXZSBjYW4gY2FsbCBrZ2l0
LXMycSAtLWNsZWFuIHRvIHJlbW92ZSB0aGUgc2VudGluZWwgZmlsZSB3aGVuIHRoZQpicmFuY2hl
cyBhcmUgY2hlY2tlZCBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBBd2FpcyBCZWxhbCA8YXdhaXNfYmVs
YWxAbWVudG9yLmNvbT4KU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZp
ZWxkQHdpbmRyaXZlci5jb20+Ci0tLQogbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNz
ICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKwogbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXJu
LXRvb2xzL2tlcm4tdG9vbHMtbmF0aXZlX2dpdC5iYiB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2Vz
L2tlcm5lbC15b2N0by5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNz
CmluZGV4IGVlMGE0ZDhkOWQzNy4uMGJmNjQ4ODZlMzY3IDEwMDY0NAotLS0gYS9tZXRhL2NsYXNz
ZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5i
YmNsYXNzCkBAIC0zODgsNiArMzg4LDEwIEBAIGRvX3ZhbGlkYXRlX2JyYW5jaGVzKCkgewogCQkJ
Y3VycmVudF9icmFuY2g9YGdpdCByZXYtcGFyc2UgLS1hYmJyZXYtcmVmIEhFQURgCiAJCQlnaXQg
YnJhbmNoICIkY3VycmVudF9icmFuY2gtb3JpZyIKIAkJCWdpdCByZXNldCAtLWhhcmQgJHtmb3Jj
ZV9zcmNyZXZ9CisJCQkjIFdlJ3ZlIGNoZWNrZWQgb3V0IEhFQUQsIG1ha2Ugc3VyZSB3ZSBjbGVh
bnVwIGtnaXQtczJxIGZlbmNlIHBvc3QgY2hlY2sKKwkJCSMgc28gdGhlIHBhdGNoZXMgYXJlIGFw
cGxpZWQgYXMgZXhwZWN0ZWQgb3RoZXJ3aXNlIG5vIHBhdGNoaW5nCisJCQkjIHdvdWxkIGJlIGRv
bmUgaW4gc29tZSBjb3JuZXIgY2FzZXMuCisJCQlrZ2l0LXMycSAtLWNsZWFuCiAJCWZpCiAJZmkK
IH0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2Vybi10b29scy9rZXJuLXRvb2xz
LW5hdGl2ZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tlcm4tdG9vbHMva2Vybi10b29s
cy1uYXRpdmVfZ2l0LmJiCmluZGV4IDRiMWRlNTc1MmM5My4uMDNmOGNlM2NjMjUzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tlcm4tdG9vbHMva2Vybi10b29scy1uYXRpdmVfZ2l0
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2Vybi10b29scy9rZXJuLXRvb2xzLW5hdGl2
ZV9naXQuYmIKQEAgLTQsNyArNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2dpdC90
b29scy9rZ2l0O2JlZ2lubGluZT01O2VuZGxpbmU9OTttZDU9YTZjMmZhOGFlZjFiCiAKIERFUEVO
RFMgPSAiZ2l0LW5hdGl2ZSIKIAotU1JDUkVWID0gImMxNDQ0MGQ0ZTdhZTAxNjBjMjYwZWQ2NWMz
ZTEyM2JlNWRjOTdhZTgiCitTUkNSRVYgPSAiNWRlYWRhODc5NDA0ODIwZGIxNDY2ODU3MjllODli
YTA4ODdmYzBlZSIKIFBSID0gInIxMiIKIFBWID0gIjAuMitnaXQke1NSQ1BWfSIKIAotLSAKMi41
LjAKCg==

--001a1137ac144b24a40547a45746--
