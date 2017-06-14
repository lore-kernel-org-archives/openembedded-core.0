Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1922078335
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 12:57:25 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id l75so64085060ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=6TMlA4QycdTrnBpwvSeARnPKiH80O9D+wBDz0VYmSY0=;
	b=Q+rXipw/5iv7u1HRfZAmAFfp9nn1DYxY1wPPV5am+7vmXnw4K45SXFFkXphtWWeNER
	pm5hlgG853E8NUcDKrCNaFhj7p218jx5GdYdFdMRqlJWBgrvNA0ysnxOmq+ay7Stuc5l
	CVfen0q1aFlkynALz9wD6WMkbxLAc++lKvDXFIHVBAYwVhUN5C2aIzm87ShCRzn5AnCi
	IvVQPrKs0aScIog+irJEW5C+AbQ5XrD1DzKhWERtDBMlW/ZXk1M4V8ctmJiS3Ou+tm2Y
	8zB199m8cafwaHCCYlzYp4rUO3kSCsReII6/bMVgM4UmQ0QwU6U7T2pTOE5JTxEqujv4
	vNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=6TMlA4QycdTrnBpwvSeARnPKiH80O9D+wBDz0VYmSY0=;
	b=FnwYqR+nKK8QqXiyP2zFAsi6ypMQJgImSHa99AK9WTtbQUgXmoaqLzmvAaYS/rk8ps
	Libp0qaF6SbKECRdUgTWnPKqCgfAINuqanrbm5RdffsDLY/Nn2UuVWvTiWLRSZF0/cKN
	rVuOOGNnLwsENgPTABc3KSeCiR/6W9XOAnMXyvC9IcKi+G4E++I+G+eKb3+IB5GCLOog
	yrxqKr9gKKv1/+OVNrb0k6HUH0aWE98PLZTqbRFdfLZckkC7F5ZaXZEkJOhXII1qWCvm
	Wne5IwH2kGjPbwSil7nzhRfWjqKa3vjuivbJL8H7Ksx1ay/iIrkbgnedU3oVuYfzQzJi
	WN/Q==
X-Gm-Message-State: AKS2vOwdgJ21NPoivLTTyUqWAqettQWEj1sHu+VA0wfn3zTAJySr0b1V
	xrudpszkDhm6DfBjewBewU7iC6VxwtOM
X-Received: by 10.129.44.196 with SMTP id s187mr384492yws.259.1497445046595;
	Wed, 14 Jun 2017 05:57:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 14 Jun 2017 05:57:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Jun 2017 14:57:26 +0200
Message-ID: <CA+chaQf0chop2q_9UD9aqDe+9dZbMdEXtB2Y636REOTFXoDBkw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Patchwork git hooks for meta-oe repository
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
X-List-Received-Date: Wed, 14 Jun 2017 12:57:27 -0000
Content-Type: multipart/alternative; boundary="001a1141fa7612ceec0551eb18bd"

--001a1141fa7612ceec0551eb18bd
Content-Type: text/plain; charset="UTF-8"

I don't know if they are supposed to work now, but the output from git
remote indicates that they probably don't work:

remote: /usr/local/patchwork/tools/post-receive_standalone.hook: line 65:
$4: unbound variable

remote: ++ git -C Next rev-parse
remote: ++ git -C Next rev-list --stdin --no-merges --reverse
cd021470e9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0
c5757bd25eea6158c7e9d567f
remote: fatal: Cannot change to 'Next': No such file or directory
remote: fatal: Cannot change to 'Next': No such file or directory


Whole output from 2 pushes today:

OE @ ~/meta-openembedded $ git push origin master
Counting objects: 170, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (161/161), done.
Writing objects: 100% (170/170), 34.85 KiB | 0 bytes/s, done.
Total 170 (delta 89), reused 1 (delta 0)
remote: +
STATE_MAP='refs/heads/master:Accepted;refs/heads/master-next:Master
Next;refs/heads/ross/mut:Master U
nder Test'
remote: + EXCLUDE=
remote: + PWDIR=/usr/local/patchwork/patchwork
remote: + '[' -d /usr/local/patchwork/patchwork ']'
remote: + '[' '!' -w /usr/local/patchwork/patchwork/post-receive_logs ']'
remote: + do_exit=0
remote: + trap do_exit=1 INT
remote: +
ERR_LOG_FILE=/usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalone.log

remote: + '[' '!' -f
/usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalone.log
']'
remote: + read oldrev newrev refname workdir
remote: + found=0
remote: + IFS=';'
remote: + for i in '$STATE_MAP'
remote: + key=refs/heads/master
remote: + IFS=' '
remote: + '[' refs/heads/master = refs/heads/master ']'
remote: ++ date
remote: + echo -e 'Wed Jun 14 12:51:55 UTC 2017 I: Started patch-update
attempt using commit d3dd8bc3721f3958eb7ddeb026
f7221d48daa986.\n'
remote: + update_patches 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
d3dd8bc3721f3958eb7ddeb026f7221d48daa986 Accepted
remote: + local cnt
remote: + cnt=0
remote: + local workdir
remote: /usr/local/patchwork/tools/post-receive_standalone.hook: line 65:
$4: unbound variable
remote: Sending notification emails to:
openembedded-commits@lists.openembedded.org
To git.openembedded.org:meta-openembedded
  0abf5af3f..d3dd8bc37  master -> master

OE @ ~/meta-openembedded $ git push -f origin master-next
Counting objects: 183, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (144/144), done.
Writing objects: 100% (183/183), 60.26 KiB | 0 bytes/s, done.
Total 183 (delta 89), reused 85 (delta 31)
remote: +
STATE_MAP='refs/heads/master:Accepted;refs/heads/master-next:Master
Next;refs/heads/ross/mut:Master Under Tes
t'
remote: + EXCLUDE=
remote: + PWDIR=/usr/local/patchwork/patchwork
remote: + '[' -d /usr/local/patchwork/patchwork ']'
remote: + '[' '!' -w /usr/local/patchwork/patchwork/post-receive_logs ']'
remote: + do_exit=0
remote: + trap do_exit=1 INT
remote: +
ERR_LOG_FILE=/usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalone.log

remote: + '[' '!' -f
/usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalone.log
']'
remote: + read oldrev newrev refname workdir
remote: + found=0
remote: + IFS=';'
remote: + for i in '$STATE_MAP'
remote: + key=refs/heads/master
remote: + IFS=' '
remote: + '[' refs/heads/master = refs/heads/master-next ']'
remote: + for i in '$STATE_MAP'
remote: + key=refs/heads/master-next
remote: + IFS=' '
remote: + '[' refs/heads/master-next = refs/heads/master-next ']'
remote: ++ date
remote: + echo -e 'Wed Jun 14 12:52:04 UTC 2017 I: Started patch-update
attempt using commit 3e6defe4735b9a0c5757bd25ee
a6158c7e9d567f.\n'
remote: + update_patches cd021470e9055422992a1adeae3f1f1ec59deab6
3e6defe4735b9a0c5757bd25eea6158c7e9d567f Master Next
remote: + local cnt
remote: + cnt=0
remote: + local workdir
remote: + workdir=Next
remote: + local revparse
remote: + local revs
remote: + '[' -z '' ']'
remote: + revparse=rev-parse
remote: ++ git -C Next rev-parse
remote: ++ git -C Next rev-list --stdin --no-merges --reverse
cd021470e9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0
c5757bd25eea6158c7e9d567f
remote: fatal: Cannot change to 'Next': No such file or directory
remote: fatal: Cannot change to 'Next': No such file or directory
remote: + revs=
remote: Sending notification emails to:
openembedded-commits@lists.openembedded.org
To git.openembedded.org:meta-openembedded
+ cd021470e...3e6defe47 master-next -> master-next (forced update)

--001a1141fa7612ceec0551eb18bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know if they are supposed to work now, but the=
 output from git remote indicates that they probably don&#39;t work:<div><b=
r></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb=
(0,0,0)">remote: /usr/local/patchwork/tools/post-receive_standalone.hook: l=
ine 65: $4: unbound variable</span><br></span></div><div><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0)"><br></span></span></di=
v><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0=
)">remote: ++ git -C Next rev-parse
</span><br>remote: ++ git -C Next rev-list --stdin --no-merges --reverse cd=
021470e9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0<br>c5757bd25eea6158=
c7e9d567f =C2=A0=C2=A0<br>remote: fatal: Cannot change to &#39;Next&#39;: N=
o such file or directory
<br>remote: fatal: Cannot change to &#39;Next&#39;: No such file or directo=
ry<br>
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">Whole output from 2 pushes tod=
ay:</span></div><div><span style=3D"font-family:monospace"><br></span></div=
><div><span style=3D"font-family:monospace"><span style=3D"font-weight:bold=
;color:rgb(84,255,84)">OE @</span><span style=3D"font-weight:bold;color:rgb=
(84,84,255)"> ~/meta-openembedded $</span><span style=3D"color:rgb(0,0,0)">=
 git push origin master
</span><br>Counting objects: 170, done.
<br>Delta compression using up to 8 threads.
<br>Compressing objects: 100% (161/161), done.
<br>Writing objects: 100% (170/170), 34.85 KiB | 0 bytes/s, done.
<br>Total 170 (delta 89), reused 1 (delta 0)
<br>remote: + STATE_MAP=3D&#39;refs/heads/master:Accepted;refs/heads/master=
-next:Master Next;refs/heads/ross/mut:Master U
<br>nder Test&#39;
<br>remote: + EXCLUDE=3D
<br>remote: + PWDIR=3D/usr/local/patchwork/patchwork
<br>remote: + &#39;[&#39; -d /usr/local/patchwork/patchwork &#39;]&#39;
<br>remote: + &#39;[&#39; &#39;!&#39; -w /usr/local/patchwork/patchwork/pos=
t-receive_logs &#39;]&#39;
<br>remote: + do_exit=3D0
<br>remote: + trap do_exit=3D1 INT
<br>remote: + ERR_LOG_FILE=3D/usr/local/patchwork/patchwork/post-receive_lo=
gs/post_receive_standalone.log
<br>remote: + &#39;[&#39; &#39;!&#39; -f /usr/local/patchwork/patchwork/pos=
t-receive_logs/post_receive_standalone.log &#39;]&#39;
<br>remote: + read oldrev newrev refname workdir
<br>remote: + found=3D0
<br>remote: + IFS=3D&#39;;&#39;
<br>remote: + for i in &#39;$STATE_MAP&#39;
<br>remote: + key=3Drefs/heads/master
<br>remote: + IFS=3D&#39; &#39;
<br>remote: + &#39;[&#39; refs/heads/master =3D refs/heads/master &#39;]&#3=
9;
<br>remote: ++ date
<br>remote: + echo -e &#39;Wed Jun 14 12:51:55 UTC 2017 I: Started patch-up=
date attempt using commit d3dd8bc3721f3958eb7ddeb026
<br>f7221d48daa986.\n&#39;
<br>remote: + update_patches 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837 d3dd8=
bc3721f3958eb7ddeb026f7221d48daa986 Accepted
<br>remote: + local cnt
<br>remote: + cnt=3D0
<br>remote: + local workdir
<br>remote: /usr/local/patchwork/tools/post-receive_standalone.hook: line 6=
5: $4: unbound variable
<br>remote: Sending notification emails to: <a href=3D"mailto:openembedded-=
commits@lists.openembedded.org">openembedded-commits@lists.openembedded.org=
</a>
<br>To git.openembedded.org:meta-openembedded
<br> =C2=A0=C2=A00abf5af3f..d3dd8bc37 =C2=A0master -&gt; master</span></div=
><div><span style=3D"font-family:monospace"><br></span></div><div><span sty=
le=3D"font-family:monospace"><span style=3D"font-weight:bold;color:rgb(84,2=
55,84)">OE @</span><span style=3D"font-weight:bold;color:rgb(84,84,255)"> ~=
/meta-openembedded $</span><span style=3D"color:rgb(0,0,0)"> git push -f or=
igin master-next
</span><br>Counting objects: 183, done.
<br>Delta compression using up to 8 threads.
<br>Compressing objects: 100% (144/144), done.
<br>Writing objects: 100% (183/183), 60.26 KiB | 0 bytes/s, done.
<br>Total 183 (delta 89), reused 85 (delta 31)
<br>remote: + STATE_MAP=3D&#39;refs/heads/master:Accepted;refs/heads/master=
-next:Master Next;refs/heads/ross/mut:Master Under Tes<br>t&#39;
<br>remote: + EXCLUDE=3D
<br>remote: + PWDIR=3D/usr/local/patchwork/patchwork
<br>remote: + &#39;[&#39; -d /usr/local/patchwork/patchwork &#39;]&#39;
<br>remote: + &#39;[&#39; &#39;!&#39; -w /usr/local/patchwork/patchwork/pos=
t-receive_logs &#39;]&#39;
<br>remote: + do_exit=3D0
<br>remote: + trap do_exit=3D1 INT
<br>remote: + ERR_LOG_FILE=3D/usr/local/patchwork/patchwork/post-receive_lo=
gs/post_receive_standalone.log
<br>remote: + &#39;[&#39; &#39;!&#39; -f /usr/local/patchwork/patchwork/pos=
t-receive_logs/post_receive_standalone.log &#39;]&#39;
<br>remote: + read oldrev newrev refname workdir
<br>remote: + found=3D0
<br>remote: + IFS=3D&#39;;&#39;
<br>remote: + for i in &#39;$STATE_MAP&#39;
<br>remote: + key=3Drefs/heads/master
<br>remote: + IFS=3D&#39; &#39;
<br>remote: + &#39;[&#39; refs/heads/master =3D refs/heads/master-next &#39=
;]&#39;
<br>remote: + for i in &#39;$STATE_MAP&#39;
<br>remote: + key=3Drefs/heads/master-next
<br>remote: + IFS=3D&#39; &#39;
<br>remote: + &#39;[&#39; refs/heads/master-next =3D refs/heads/master-next=
 &#39;]&#39;
<br>remote: ++ date
<br>remote: + echo -e &#39;Wed Jun 14 12:52:04 UTC 2017 I: Started patch-up=
date attempt using commit 3e6defe4735b9a0c5757bd25ee<br>a6158c7e9d567f.\n&#=
39;
<br>remote: + update_patches cd021470e9055422992a1adeae3f1f1ec59deab6 3e6de=
fe4735b9a0c5757bd25eea6158c7e9d567f Master Next
<br>remote: + local cnt
<br>remote: + cnt=3D0
<br>remote: + local workdir
<br>remote: + workdir=3DNext
<br>remote: + local revparse =C2=A0=C2=A0=C2=A0<br>remote: + local revs
<br>remote: + &#39;[&#39; -z &#39;&#39; &#39;]&#39;
<br>remote: + revparse=3Drev-parse
<br>remote: ++ git -C Next rev-parse
<br>remote: ++ git -C Next rev-list --stdin --no-merges --reverse cd021470e=
9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0<br>c5757bd25eea6158c7e9d56=
7f =C2=A0=C2=A0<br>remote: fatal: Cannot change to &#39;Next&#39;: No such =
file or directory
<br>remote: fatal: Cannot change to &#39;Next&#39;: No such file or directo=
ry
<br>remote: + revs=3D
<br>remote: Sending notification emails to: <a href=3D"mailto:openembedded-=
commits@lists.openembedded.org">openembedded-commits@lists.openembedded.org=
</a><br>
</span><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0=
)">To git.openembedded.org:meta-openembedded
</span><br> + cd021470e...3e6defe47 master-next -&gt; master-next (forced u=
pdate)<br>
<br></span><span style=3D"font-family:monospace">
<br></span></div></div>

--001a1141fa7612ceec0551eb18bd--
