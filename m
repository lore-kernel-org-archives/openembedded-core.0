Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0731CC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 06:29:56 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.14693.1702794586409938876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 22:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQTs+lzb;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbc666461daso1345700276.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 22:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702794585; x=1703399385; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z3zcrtri/DWzy6796n4pBsedwlQLXeJ5fJtYjZatM7w=;
        b=AQTs+lzbGPpCryVqYpjq4nKbDUkAXSA1FocdQYoUx9q7YNo4iyQlSpVM6RXXG/EDRa
         sJ1QD50+DYTAvP1t1WiMsn9lag4tCEqjqCr0EKt999gDkhza6MuleDPC4MZYSMEkdX0M
         P658EQLunhhKXpq/AKzQYfpv8LXglrH9eF7yl1lefz5izdhRp9AOoQ1RtyIvnbTgwKX+
         1Kr33FLekF2N9wtYp0OKMkAX8o6KZ4TCKPmOSSDIsuDXQSqftGVIVWZr6Ilg+wnlEXse
         QPtPtS9lT+XWWNOnEhrwFxzjY6N5aEQSN/1mbw+AwMN+OzL0rYgUg/zMhrcoDKkw2Uvq
         JiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702794585; x=1703399385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3zcrtri/DWzy6796n4pBsedwlQLXeJ5fJtYjZatM7w=;
        b=ab35HLukhUx8ZAd9qJ9tKoTpBH4pzdS0R8t7cdSi76cCBwABjjtq3vgLohUxSCBjYr
         61xAES0bUthVIFPH74d3YceDBeZ6jU1bBfTj51KNSzbW/OHmlHAFhEs+De/LUNQc4yz7
         IvFDhsbO/B8pFs9DAg0Y14QfjwBIO9Xm6c7VA9G8AKrLa4puQbryo+UhB/LcZnUmAG4N
         J7HXbXUfMGxhghED9S7GnwusMdst8XSF6ljaLO6SvMENdpjG/JCGFvEgOrVaadmhj7jj
         2daIhZVehloVCZ2z/EtEyUlFilq+kc58h/90fhIdWXNo882zORC8QmGUvxBh6qIbY86y
         VynA==
X-Gm-Message-State: AOJu0YxvNFJIrTpDI6YjPTl9MV8qQfKh+3nz5ToC65425c4PSlS0v7Fq
	vAsbvpg+p6ifeVZJyKZWrn1wIl4HexpauTQiqzQCv63o
X-Google-Smtp-Source: AGHT+IFQHDq+9e3yeghW03gkg6/QQJ8MMSdGC+a8ymUHIhI2cE4g7/gIr8SWeR6E6ZJUE4J75HTof6VzRtpjviijxWQ=
X-Received: by 2002:a0d:ea4b:0:b0:5e4:fa10:cef0 with SMTP id
 t72-20020a0dea4b000000b005e4fa10cef0mr1976345ywe.7.1702794585180; Sat, 16 Dec
 2023 22:29:45 -0800 (PST)
MIME-Version: 1.0
References: <0101018c766677e7-75698dfe-728c-4fdd-866f-3ccc895d8b95-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c766677e7-75698dfe-728c-4fdd-866f-3ccc895d8b95-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 16 Dec 2023 22:29:34 -0800
Message-ID: <CANx9H-Ahc-u4Q_4RDbqqRt3biBHsJQ_Ox4R+Vdy2QUcALHArhw@mail.gmail.com>
Subject: Re: Patchtest results for [PATCH 5/7] oe-selfest: add maturn runtime
 (testimage) test
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000600fbb060caec28a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 06:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192585

--000000000000600fbb060caec28a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It appears patchtest gets confused when emoji Unicode characters are
present.

On Sat, Dec 16, 2023 at 10:11=E2=80=AFPM <patchtest@automation.yoctoproject=
.org>
wrote:

> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch
> /home/patchtest/share/mboxes/5-7-oe-selfest-add-maturn-runtime-testimage-=
test.patch
>
> FAIL: test mbox format: Series has malformed diff lines. Create the serie=
s
> again using git-format-patch and ensure it applies using git am
> (test_mbox.TestMbox.test_mbox_format)
>
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length
> (test_metadata.TestMetadata.test_max_line_length)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list
> (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: Python-unidiff parse error
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: Patch cannot be merged
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE tag format: Parse error Hunk is shorter than expected
> (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: Parse error Hunk is shorter than
> expected (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: Parse error Hunk is shorter than
> expected (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes,
> skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: Python-unidiff parse error
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: Patch cannot be merged
> (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>

--000000000000600fbb060caec28a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It appears patchtest gets confused when emoji Unicode cha=
racters are present.</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Dec 16, 2023 at 10:11=E2=80=AFPM &lt;<a hr=
ef=3D"mailto:patchtest@automation.yoctoproject.org">patchtest@automation.yo=
ctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">Thank you for your =
submission. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/5-7-oe-selfest-add-maturn-runtim=
e-testimage-test.patch<br>
<br>
FAIL: test mbox format: Series has malformed diff lines. Create the series =
again using git-format-patch and ensure it applies using git am (test_mbox.=
TestMbox.test_mbox_format)<br>
<br>
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)<br>
<br>
SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint=
.pretest_pylint)<br>
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.Tes=
tMetadata.pretest_src_uri_left_files)<br>
SKIP: test CVE tag format: Parse error Hunk is shorter than expected (test_=
patch.TestPatch.test_cve_tag_format)<br>
SKIP: test Signed-off-by presence: Parse error Hunk is shorter than expecte=
d (test_patch.TestPatch.test_signed_off_by_presence)<br>
SKIP: test Upstream-Status presence: Parse error Hunk is shorter than expec=
ted (test_patch.TestPatch.test_upstream_status_presence_format)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test lic files chksum modified not mentioned: No modified recipes, sk=
ipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_=
mentioned)<br>
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)<br>
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.te=
st_pylint)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMe=
tadata.test_src_uri_left_files)<br>
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)<br>
<br>
---<br>
<br>
Please address the issues identified and<br>
submit a new revision of the patch, or alternatively, reply to this<br>
email with an explanation of why the patch should be accepted. If you<br>
believe these results are due to an error in patchtest, please submit a<br>
bug at <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://bugzilla.yoctoproject.org/</a> (use the &#39;Patcht=
est&#39; category<br>
under &#39;Yocto Project Subprojects&#39;). For more information on specifi=
c<br>
failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Patcht=
est</a>. Thank<br>
you!<br>
</blockquote></div></div>

--000000000000600fbb060caec28a--

