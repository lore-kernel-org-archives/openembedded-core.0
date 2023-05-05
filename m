Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62206C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 17:17:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.108.1683307063758752594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f2FJNZT/;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso2303579e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683307061; x=1685899061;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ok1+Idpve6BpqU6TYIrQcJ3oqi4jyhyzDVbe4W7poCM=;
        b=f2FJNZT/+ruufS2C9dQGlPVjUE75fBI3hEi3F0Lrh1+zExHjk9rD2gB5w8BjIEl7/b
         Mk7nLQV/4xX6/7l+nMEXq3Dlewd8AmpoU6b0/G17Bz2n0mUi23GAGgidP19Dy9Dsz5sD
         7e1K2wAG/J4TT67vHKjxqQ7nHDMgYYnxkjwDJIf5594rhSo1H+yZeS07R2VSboIUAIFN
         w5b3z47hn9qL7j4IesIKKW143ZoPtTAHRoveVpcv+WQRPhvJI53JzNwySnadfeLT2DCa
         1GEvPm/+UuRqmrg3Mli7gWtc3fSzVDdDqPZmVkb2hEkumVJpyr+d6cIT99e2KXXohB1g
         HVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683307061; x=1685899061;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ok1+Idpve6BpqU6TYIrQcJ3oqi4jyhyzDVbe4W7poCM=;
        b=SvYMwjuKtiXyuJkGWVvRkDNgFTQlYo0oJiPTmNgfR+Qe5i6al26paLOoS3JHmXYcUR
         k9ZCr9F9+hQMLoEesLTjdXQKMGLXSg35Nt0B7cC4CjHJTol9inzGtnLTZFRZ0xpvph/7
         vNkdv/ifceB8ZbIrS8xRrz14D0kd9ERSqx3LveV4pkJMTuATSpE33FfiN807RFp+Yb9M
         t7QilTZdxxnRZyjEasUmFOAYO5NsaAXC3i5R3eOWml6SK6J4CXFTQ+i7+SCk2+obJPk9
         jnAdMHpkK6kTfpfOBU4rg6iSloIbyNXznTEuLGOuMBSXLQXRERFGyy3wesFMCqeUvrYM
         DVCg==
X-Gm-Message-State: AC+VfDwXhVf/MKozqfCIG1PTvYUnuDSFyy6r/0jMRWLWGKJrLIonarw3
	60IJ+BFMHel8RhXXyFWq8X/IhlXPv8gw2mtnyqkz6Tpk
X-Google-Smtp-Source: ACHHUZ6Ba7k6FVSCmK9sN+4OfAR4FevLIx6JXrIZJNqcOvFOhAmE8f+EFdjT5wu+BBJN8wNBKL4cWylNr1qvFylZ0zU=
X-Received: by 2002:ac2:50c7:0:b0:4ec:85f6:5bf3 with SMTP id
 h7-20020ac250c7000000b004ec85f65bf3mr714085lfm.21.1683307061009; Fri, 05 May
 2023 10:17:41 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 19:17:29 +0200
Message-ID: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
Subject: Contributing, how it works?
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b625e05faf5775c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 17:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180960

--0000000000006b625e05faf5775c
Content-Type: text/plain; charset="UTF-8"

Hello list

I'm wondering if there are documentations on how contribution are managed
for the project.

I try to find some but didn't manage to. There are easily reachable doc
about how to contribute of course (how to make patches, fixe your identity,
send mail via git... etc) but I didn't find what I usually find on other
open source project (CONTRIBUTING.md file most of the time) like
  - what are the tests do should I run before submitting (I learnt by
practice about test image or bitbake selftest for example) ?
  - is there a specific configuration that I should test before submitting
(poky is ok, or should I also test another distro)?
  - does some commit writing rules exist ? (some projects want commits to
begin with a prefix, usually the software component that is modified by the
patch for example)
 - what are the coding rules you should follow, if any? (having common
coding rules helps greatly the review of patches, pylint for python code
for example, and I saw there are some bitbake recipes linter from meta-sca
layer)

Long story short, I really would like to know what are the different steps
a patch should go through before being merged into master (and as a side
question, what are the steps for a patch to be backported into one of the
LTS branch).

I'm deeply sorry if all these questions are obvious to you and have been
already answered somewhere, in that case, please just give me the link.

I recently started to contribute to yocto / oe and I think it will help me
to make better contributions if I know more of how it works "under the
hood".

Best regards.

--0000000000006b625e05faf5775c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello list<div dir=3D"auto"><br></div><div dir=3D"auto">I=
&#39;m wondering if there are documentations on how contribution are manage=
d for the project.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I try=
 to find some but didn&#39;t manage to. There are easily reachable doc abou=
t how to contribute of course (how to make patches, fixe your identity, sen=
d mail via git... etc) but I didn&#39;t find what I usually find on other o=
pen source project (CONTRIBUTING.md file most of the time) like=C2=A0</div>=
<div dir=3D"auto">=C2=A0 - what are the tests do should I run before submit=
ting (I learnt by practice about test image or bitbake selftest for example=
) ?=C2=A0</div><div dir=3D"auto">=C2=A0 - is there a specific configuration=
 that I should test before submitting (poky is ok, or should I also test an=
other distro)?=C2=A0</div><div dir=3D"auto">=C2=A0 - does some commit writi=
ng rules exist ? (some projects want commits to begin with a prefix, usuall=
y the software component that is modified by the patch for example)=C2=A0</=
div><div dir=3D"auto">=C2=A0- what are the coding rules you should follow, =
if any? (having common coding rules helps greatly the review of patches, py=
lint for python code for example, and I saw there are some bitbake recipes =
linter from meta-sca layer)=C2=A0<br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Long story short, I really would like to know what are the di=
fferent steps a patch should go through before being merged into master (an=
d as a side question, what are the steps for a patch to be backported into =
one of the LTS branch).=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;m deeply sorry if all these questions are obvious to you and ha=
ve been already answered somewhere, in that case, please just give me the l=
ink.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I recently started =
to contribute to yocto / oe and I think it will help me to make better cont=
ributions if I know more of how it works &quot;under the hood&quot;.=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards.=C2=A0</div=
></div>

--0000000000006b625e05faf5775c--

