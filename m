Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C58C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 02:33:16 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.48643.1698805995596003653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 19:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCzSOKQS;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso5978609276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 19:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698805995; x=1699410795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/eMX96ynnChNyvi1vcQ+1cr+7nTPrekPzjbxbD1B6uY=;
        b=cCzSOKQS1avz9p6ydl88KOzb78PgDu4zqULDA58BzE1JWIEObpAnxsYOIOkOZ0dJKC
         4ghgz1NHk95YMRxg/oU09bcNbbiYVO5KAaICzmfJp23oagC6YeJFyMNnjXY9PeoESATM
         DjOc2XnQhc+jh38EB3t/GEcKlr0yzUTJeS9iPB8pXrLhjVqOGNuMjxwR1UQA+C+ozaPo
         xsnlI31hlge1YiLNKXwswHYkhNZWdnqj867MfpfJwDF1O2QLqKiW0c617uIfUS4Uxwdq
         GfOC/+Ui+doQvIimObObjZ8iB3SrG+v3q3m749TEEpZ9i87u5IYhJ7utHtJ8qzHzfD+y
         MW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698805995; x=1699410795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eMX96ynnChNyvi1vcQ+1cr+7nTPrekPzjbxbD1B6uY=;
        b=F2Er8Nu4E2IBTz2Yzkj2xBkahW9MA23+9BMX+rEIUqtam8P/8XiBmfCHlQ4dG77181
         17C7JhKhYIEkGHb4u6gmYZVZO2N0Rq6IcqyZoqqRuf+OAM8A5UMto3XeU+1R7vjyrW7Z
         gTiOSjNtAL1zoHCBB/CFqyYf2RXMonCsexQJ+FSBF2jq3CSTvTkjbvVyeulLQ+4G6oNq
         PhBwh784QlQMs+gLj3c8/25Fcnw9SyKQdgOBrWxkz4KHlnTXQg6blAZghpE38uFTNjpB
         3RaB0kIAZFYJZ2o4S0cMAGBBojoTjr+IffUz7TBRnUld96RPXRhhvEKU3acr0AFJ9ADe
         TsRw==
X-Gm-Message-State: AOJu0YzwifgRwkqM9jc35LLgHSF3CizIvxYcoRmX0QU3j/wooZGs7nKW
	0bP4cy3B0oByDtaWEO+FhzTFP5uQ8RNNluJxYjg=
X-Google-Smtp-Source: AGHT+IH2hW9wqIAS3AIZF8to9qtFB8v5o52BCIj2LnGjr5SzdtTu64ojFOuWAV42hWxM83UJciMRqdQxkDLzbE4U90E=
X-Received: by 2002:a25:2588:0:b0:d80:68d1:b826 with SMTP id
 l130-20020a252588000000b00d8068d1b826mr13380222ybl.6.1698805994619; Tue, 31
 Oct 2023 19:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
In-Reply-To: <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 31 Oct 2023 19:33:03 -0700
Message-ID: <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da0bb106090e17b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 02:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189894

--000000000000da0bb106090e17b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 7:26=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.com>=
 wrote:

> On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin wrote:
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch /home/patchtest/share/mboxes/patchtest-shorten-test-
> > result-outputs.patch
> >
> > FAIL: test CVE presence in commit message: A CVE tag should be
> > provided in the commit message with format: "CVE: CVE-YYYY-XXXX"
> > (test_mbox.TestMbox.test_cve_presence_in_commit_message)
>
> Is this a requirement to have this in commit message in this format? I
> don't think this was being followed until now. A lot of patches seem to
> be failing this test as a result.
>

This was required when patchtest was running previously. It has been
ignored for a while now, but that does not mean we should not enforce it.
It should be documented as required.

The tags allow for machines to parse the relevant info. Anything else is
purely random and chaos.


> The wiki just mentions that CVE number should be in commit message.
>
> Thanks,
>
> Anuj
>
> >
> > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > PASS: test Signed-off-by presence
> > (test_mbox.TestMbox.test_signed_off_by_presence)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test commit message presence
> > (test_mbox.TestMbox.test_commit_message_presence)
> > PASS: test max line length
> > (test_metadata.TestMetadata.test_max_line_length)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> >
> > SKIP: pretest lic files chksum modified not mentioned: No modified
> > recipes, skipping pretest
> > (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_men
> > tioned)
> > SKIP: pretest src uri left files: No modified recipes, skipping
> > pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > SKIP: test CVE tag format: No new CVE patches introduced
> > (test_patch.TestPatch.test_cve_tag_format)
> > SKIP: test Signed-off-by presence: No new CVE patches introduced
> > (test_patch.TestPatch.test_signed_off_by_presence)
> > SKIP: test Upstream-Status presence: No new CVE patches introduced
> > (test_patch.TestPatch.test_upstream_status_presence_format)
> > SKIP: test bugzilla entry format: No bug ID found
> > (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test lic files chksum modified not mentioned: No modified
> > recipes, skipping test
> > (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentio
> > ned)
> > SKIP: test lic files chksum presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > SKIP: test license presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_license_presence)
> > SKIP: test series merge on head: Merge test is disabled for now
> > (test_mbox.TestMbox.test_series_merge_on_head)
> > SKIP: test src uri left files: No modified recipes, skipping pretest
> > (test_metadata.TestMetadata.test_src_uri_left_files)
> > SKIP: test summary presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_summary_presence)
> > SKIP: test target mailing list: Series merged, no reason to check
> > other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> >
> > ---
> >
> > Please address the issues identified and
> > submit a new revision of the patch, or alternatively, reply to this
> > email with an explanation of why the patch should be accepted. If you
> > believe these results are due to an error in patchtest, please submit
> > a
> > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
> > category
> > under 'Yocto Project Subprojects'). For more information on specific
> > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > you!
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189893):
> https://lists.openembedded.org/g/openembedded-core/message/189893
> Mute This Topic: https://lists.openembedded.org/mt/102275009/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000da0bb106090e17b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 31, 2023 at 7:26=E2=80=AFPM Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin=
 wrote:<br>
&gt; Thank you for your submission. Patchtest identified one<br>
&gt; or more issues with the patch. Please see the log below for<br>
&gt; more information:<br>
&gt; <br>
&gt; ---<br>
&gt; Testing patch /home/patchtest/share/mboxes/patchtest-shorten-test-<br>
&gt; result-outputs.patch<br>
&gt; <br>
&gt; FAIL: test CVE presence in commit message: A CVE tag should be<br>
&gt; provided in the commit message with format: &quot;CVE: CVE-YYYY-XXXX&q=
uot;<br>
&gt; (test_mbox.TestMbox.test_cve_presence_in_commit_message)<br>
<br>
Is this a requirement to have this in commit message in this format? I<br>
don&#39;t think this was being followed until now. A lot of patches seem to=
<br>
be failing this test as a result.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This was require=
d when patchtest was running previously. It has been ignored for a while no=
w, but that does not mean we should not enforce it. It should be documented=
 as required.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The tags a=
llow for machines to parse the relevant info. Anything else is purely rando=
m and chaos.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
The wiki just mentions that CVE number should be in commit message.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)<br>
&gt; PASS: test Signed-off-by presence<br>
&gt; (test_mbox.TestMbox.test_signed_off_by_presence)<br>
&gt; PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
&gt; PASS: test commit message presence<br>
&gt; (test_mbox.TestMbox.test_commit_message_presence)<br>
&gt; PASS: test max line length<br>
&gt; (test_metadata.TestMetadata.test_max_line_length)<br>
&gt; PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
&gt; PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<b=
r>
&gt; PASS: test pylint (test_python_pylint.PyLint.test_pylint)<br>
&gt; PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<b=
r>
&gt; PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<b=
r>
&gt; <br>
&gt; SKIP: pretest lic files chksum modified not mentioned: No modified<br>
&gt; recipes, skipping pretest<br>
&gt; (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_men<=
br>
&gt; tioned)<br>
&gt; SKIP: pretest src uri left files: No modified recipes, skipping<br>
&gt; pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)<br>
&gt; SKIP: test CVE tag format: No new CVE patches introduced<br>
&gt; (test_patch.TestPatch.test_cve_tag_format)<br>
&gt; SKIP: test Signed-off-by presence: No new CVE patches introduced<br>
&gt; (test_patch.TestPatch.test_signed_off_by_presence)<br>
&gt; SKIP: test Upstream-Status presence: No new CVE patches introduced<br>
&gt; (test_patch.TestPatch.test_upstream_status_presence_format)<br>
&gt; SKIP: test bugzilla entry format: No bug ID found<br>
&gt; (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
&gt; SKIP: test lic files chksum modified not mentioned: No modified<br>
&gt; recipes, skipping test<br>
&gt; (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentio<=
br>
&gt; ned)<br>
&gt; SKIP: test lic files chksum presence: No added recipes, skipping test<=
br>
&gt; (test_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
&gt; SKIP: test license presence: No added recipes, skipping test<br>
&gt; (test_metadata.TestMetadata.test_license_presence)<br>
&gt; SKIP: test series merge on head: Merge test is disabled for now<br>
&gt; (test_mbox.TestMbox.test_series_merge_on_head)<br>
&gt; SKIP: test src uri left files: No modified recipes, skipping pretest<b=
r>
&gt; (test_metadata.TestMetadata.test_src_uri_left_files)<br>
&gt; SKIP: test summary presence: No added recipes, skipping test<br>
&gt; (test_metadata.TestMetadata.test_summary_presence)<br>
&gt; SKIP: test target mailing list: Series merged, no reason to check<br>
&gt; other mailing lists (test_mbox.TestMbox.test_target_mailing_list)<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; Please address the issues identified and<br>
&gt; submit a new revision of the patch, or alternatively, reply to this<br=
>
&gt; email with an explanation of why the patch should be accepted. If you<=
br>
&gt; believe these results are due to an error in patchtest, please submit<=
br>
&gt; a<br>
&gt; bug at <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"noreferre=
r" target=3D"_blank">https://bugzilla.yoctoproject.org/</a>=C2=A0(use the &=
#39;Patchtest&#39;<br>
&gt; category<br>
&gt; under &#39;Yocto Project Subprojects&#39;). For more information on sp=
ecific<br>
&gt; failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest=
" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/P=
atchtest</a>. Thank<br>
&gt; you!<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189893): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189893" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189893</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102275009/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102275009/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000da0bb106090e17b3--

