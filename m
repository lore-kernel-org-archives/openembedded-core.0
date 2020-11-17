Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.9005.1605625163542366998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 06:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nb7T4xNc;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 19so3550378wmf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 06:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+2EK1E53FMQxPbO3jvyfAo+S4BTI0xpjBSjaB7b5E+o=;
        b=nb7T4xNcHP6HQA5JulG+svyzW0pX3BjwtJkG/pmfDXSrXgbP0Q8zlqTi3Cy4Vo/+Np
         WHKXizsjfglAeHIktxDr/WUoj5Iii0WbEbugiZMffRJhAIoVB/bKJY1C5cuLf0Nij8Uy
         Rq4K1nV+XxSthirP3nOVjMstF0fn2mCpt7BBX88o4aK08ntkW63VfVjP1lNf38iUdZJK
         e6DMsp4vDW4Uzc1oUzKMMYSc1JU228QqgFDoOG42GZaOLMQNIOzbdUAxBGjU2ZoAX7Tp
         j/1eC5xjBGPZvP/qC1JULh4Ez3AYyn7RayQseeClQs+0c1cHokzdjgPHCN7c+JjkviMc
         95Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+2EK1E53FMQxPbO3jvyfAo+S4BTI0xpjBSjaB7b5E+o=;
        b=tM89uSnjjCn70J3PG1J1hXOWFmcICb/3K7Ap/BHiE+epAnHaHWJgsoK9AYyot0PNIl
         uyc7f5J8iZXDh4GrZWfG2TECxAltQ61BOdHM/EE/K/cZV5b+nfZnSYDKeYUw8xDPm/6y
         OGxXhiIXMw0iwlc6WudHT36LJaeG3yqUuPRsucYImTUddXPV2BBW12CP3+qbb3VdFzBZ
         2oUVDYwZ7R06BHz/tPj7tc0aD2MNe4ibLcKIFNSZKHr0PAZtk7ItZ27gkmAqhdMWWB8h
         lp9hoXhdP9YIR+pyzQ9nADvkOv3bStATiUmlOo4jISiMXAC27N2scx8VQNtLHVr4xZyH
         cLCQ==
X-Gm-Message-State: AOAM5335kQvGwQeEmNzICpQWwLFm1v6u+JxAkfcS5EN4Q+6AP6Eq1mhI
	BZwFF/4IIoyRQtDwjJ/cX7XxtyV6iQgqhSuHLW4Y2ccR42A=
X-Google-Smtp-Source: ABdhPJyMsxKZRrXa864sak/myqSkQeBNLlovNRDu9wd5G7Z6COnBMDaePe6cMckITDx7CKMW+Lc246/5GUfNvwfHaUs=
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr4623828wma.147.1605625161449;
 Tue, 17 Nov 2020 06:59:21 -0800 (PST)
MIME-Version: 1.0
From: "nefethael" <vincent.prince.fr@gmail.com>
Date: Tue, 17 Nov 2020 15:59:10 +0100
Message-ID: <CAB2nKc_WuU_YJAA9q+Yu_kbg+7XQFPOmGaKrg1PtzTfQe0TD8w@mail.gmail.com>
Subject: cve-check: custom hook for unpatched CVEs
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000064043f05b44ebd06"

--00000000000064043f05b44ebd06
Content-Type: text/plain; charset="UTF-8"

 Hello Team,

I wish I could extend cve-check.bbclass to do some custom actions when some
unpatched CVEs are discovered.
For now, I just duplicated class to another my-cve-check.bbclass but
cve-update-db-native.bb fails due
to
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/meta/cve-update-db-native.bb?id=cbc717350b21fb417fa6f83621022ac633a26124
.
I also tried to just override cve-check.bbclass in a custom layer but it
seems it's quite a mess to do it if I follow correctly
https://wiki.yoctoproject.org/wiki/Technical_FAQ#How_do_I_override_a_bbclass_file.3F

I'm not a Yocto guru so I'm not sure how to contribute to add some kind of
custom hooks in existing code so that we can extend cve-check process?

Thanks for your help,
Vincent

--00000000000064043f05b44ebd06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
Hello Team, <br><br>I wish I could extend cve-check.bbclass to do some cust=
om actions when some unpatched CVEs are discovered. <br>For now, I just dup=
licated class to another my-cve-check.bbclass but <a href=3D"http://cve-upd=
ate-db-native.bb">cve-update-db-native.bb</a> fails due<br>to <a href=3D"ht=
tp://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/meta/=
cve-update-db-native.bb?id=3Dcbc717350b21fb417fa6f83621022ac633a26124" targ=
et=3D"_blank">http://cgit.openembedded.org/openembedded-core/commit/meta/re=
cipes-core/meta/cve-update-db-native.bb?id=3Dcbc717350b21fb417fa6f83621022a=
c633a26124</a> .<br>I also tried to just override cve-check.bbclass in a cu=
stom layer but it seems it&#39;s quite a mess to do it if I follow correctl=
y <br><a href=3D"https://wiki.yoctoproject.org/wiki/Technical_FAQ#How_do_I_=
override_a_bbclass_file.3F" target=3D"_blank">https://wiki.yoctoproject.org=
/wiki/Technical_FAQ#How_do_I_override_a_bbclass_file.3F</a><br><br>I&#39;m
 not a Yocto guru so I&#39;m not sure how to contribute to add some kind of=
=20
custom hooks in existing code so that we can extend cve-check process?<br><=
br>Thanks for your help,<br>Vincent

</div>

--00000000000064043f05b44ebd06--
