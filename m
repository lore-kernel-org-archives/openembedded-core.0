Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2417.1793956988428694968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dXJYk6Ym;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so572523eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 01:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793956988; cv=none;
        d=google.com; s=arc-20260327;
        b=GTUsaXkANUxvcPuPzd/LrygyzBi4+PIn1XyQjcb3QBX4uUa7iPy/mOrvagDbm4i7Ej
         ql8dFsq6oV6aG7gF2z1vQbfM3aZqaoydMqg1T1YqeSvmneolzWnVTmTfkqmWHe4dgyO1
         VlCvw9uVqLYENnZq0CGr2u58mG1J0i5kD2pbe9KaE5Nu8GTdn4JPLwIyFo3T8HbI3Ab4
         FonCzX6WsJ4G+L2W2O9gYKaObX+PEFdTb66m8z/UrZnzUiS72IUgoEjnv1W78TUxWSlp
         z/Xcx3fAXJQfi6qFX6xrQvlOedrCoKw8Rgcpnya63DXnaplIg73jRDSv8KxVBqIJa9J3
         ApUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rdgOpn6G9td9C2WCByxuLh0fkA1p+2j4JMceOOKcVH0=;
        fh=3ODOBvrnyLb9LIEoT6yOMLI6ckVYInlS8hnLdPQpDlo=;
        b=ZPDbOpUxJxPyE141BHoz6bECAIeONkf2T660wpteroJEsp+pMV+A7ZbtS82TyfkHtR
         0dMP7xsFTmZGxftnzuWMZPpvyx3VpoipYuvvb3gntzZArlT/mg5JfoaRIW54x+W5pE1D
         3tQMrxahKILMLk4fQeoAjdf9u1plHAk36d58wZUdOM4wm5fOQmhV8JPmZ0wfXwV+8Hkh
         C9nogiY3rt9uJHBID3l9NLJJ2njTOrj+Ejok4k2DkNGMbFseM+qGZYK5AYUx5kpN3w/2
         DqOd+uZkUMlpndQ4Bvj64kkai8rw3A4qbIfvp+k4uHqXfzWO+JBB1uzDG971LAkLmdgU
         9R6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956988; x=1794561788; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdgOpn6G9td9C2WCByxuLh0fkA1p+2j4JMceOOKcVH0=;
        b=dXJYk6YmqJ6WQ3gZLFf5pjqqbEM7+LnlKQKq6aCM+bKVaMiZPut6DSQ9SSHpN3Cs4U
         yD5N0sL/KviMGZrTc3DJjdnm2DL/bZ/Gb45xed4RF+Mi6k31WgkNHyvaUc6rytkx5g8K
         8Rj8zN1KnpGRRuQURo7J/fuydVj4PvZ3WW69IXl4Ak0B3kM82ccUYicG+9H9u/qRXBXy
         Ca5Zl5a9KDO59eKQTXkM/okTRtNl1ZSKsmSf2x6MHvGs1yops4RP1gkC/ctDqhsfdyz8
         h6W0a62DEsrkEg/3v+7zJYwb21+OwKWQHHsLQ9xg+QMNj4lUcLuogwJLSUfecJvFNZKk
         OVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956988; x=1794561788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdgOpn6G9td9C2WCByxuLh0fkA1p+2j4JMceOOKcVH0=;
        b=THKWfFlHtntIBQdBaBA6vzoXJMgzTBojPmgsH0ztpn5P2ywEImRkZcUJnRP5e0tvmV
         pv1wkjr/rCSceyDqMF7V6f8dBhRF2W5RBekupqBLfM7Je9/p9AV5MoaTKdCNuYeN8lG1
         33oSYIx2EKktsWwcKPvYwnCu+T7jLfsoEsRNbJsTn5fZYQA1+hLwh2WvsjT+73SV8LKt
         Pw9/OM0G2dytCBbMH2U9qmzvOsHLENTcXV+tZJnUwZJUbBh9a5Gwp88hmnu8lQneITWH
         SsMtRKRUB/QG3CA+VE1H2HoD5Ia+opmr2nzfTWkL+sSqCjS3Bgf1ktTmlthiu/sQ1aVj
         cBrQ==
X-Gm-Message-State: APuU4Z8GrfruQAkyrDLiugQ8kzUp/+jE28nUHOe+3ZQG93HrGHJh/UQe
	ZO3pVNsb8LHK8a86RwvVvqicJELzK4SMaEqCEvMx6U4fozAz2iJowyZxDWyArkoVhem64HZYAFw
	IJ4ULAgeNp0XmBtoKfBPe9R1igA9EkBvWHGHEk2iDQMxS06/dsH0n4kObD0UxT+0if/Kk3mc=
X-Gm-Gg: AYBFou25tDtR1DKNdbR4HMxUuHgjGyX5IFhBMyoRLhHsonQHYB+EnHSY4f+ZdhSj3AD
	AgAZyEDATanRJsS1rR8Xys9UqtMbL5krr6PY3Hd+jggKbDF24M39I5lCm4m7FuTruCbmqz2S4yu
	6ShKw/9BkdcACvop6klcCIcuo05UN2ELFOhWZ5pc+i/t5Qj1wrPchmU8kuWYctblykFyLsUcbuj
	Y4qWt9qwc3Ec3j8z03lZ3S++PBmBbtZVngcc7MsHej/K85XQalqEF/tZXT2YCxo4Z25JZ7F5ZPA
	z8rhM+R9lDeM1WGe2c0aga5krpYuaP3WzRbLuL0I0Ai5KEljQsWJ6Pqd9vUht9nZUePvVmo0qp/
	eZ2bYRPP3QCvgd5FKRl7yZASkIOADlPypq7tnugGIHVYRTfQOV8GcLoJmAT5I+oOJZL02pw==
X-Received: by 2002:a05:693c:68c3:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36f754414a0mr2734996eec.9.1793956987622; Fri, 06 Nov 2026
 01:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
 <20261106011324.626292-2-ragaprasanth@gmail.com> <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <CAG7eodHrvRHJj8P5MGmAxm99Umxb12qeVDaRkggFOdw+sTfjNg@mail.gmail.com>
 <CAG7eodHPk6FYtFE7-M35ymXqH40RpYEHkdoUbkcgpNKaSdYC0g@mail.gmail.com> <DMO0N33RMCHP.JKXW47OTMMNB@pbarker.dev>
In-Reply-To: <DMO0N33RMCHP.JKXW47OTMMNB@pbarker.dev>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Fri, 6 Nov 2026 18:22:55 +0900
X-Gm-Features: AclHuK_qIPv90pye84-U6EIRYTHDunhMSduB3TXSKyFpGSlq8FA-pHHP4amhOP8
Message-ID: <CAG7eodGSb_x1UPON2crNPVfe3VJzfpOby309GdbTeN0x-7CCOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
To: Paul Barker <paul@pbarker.dev>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Marko, Peter" <peter.marko@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000fd5a9c065f98282c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249628

--000000000000fd5a9c065f98282c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=91=8D

Prasanth Ramesh reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

--000000000000fd5a9c065f98282c
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=91=8D",
  "version": 1
}
--000000000000fd5a9c065f98282c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=91=8D<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Prasanth Ramesh reacted via=
 <a href=3D"https://www.google.com/gmail/about/?utm_source=3Dgmail-in-produ=
ct&amp;utm_medium=3Det&amp;utm_campaign=3Demojireactionemail#app">Gmail</a>=
</p></div>

--000000000000fd5a9c065f98282c--
