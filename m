Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 18442600EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 12:29:03 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id b5so5114125itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S879pAUDXjKcHIJ4zlhIeIy0C2Fm7dxYfIo50MEyrSM=;
	b=B041WggOptkF5q8KV+MSkbBSYGlHO+1E2mKSPcTQ5keE6hexh3yHkFdICYwREUZ2Sa
	xZXjg8VJMXkLNGOClUtdOj9vFa1d+ryhKvO5nCRL7J7yWgbbvwPwuiEPLIwymzduBzUq
	eI/rROXA9FpP7ScSD8zA/hys1CupGiwmVT5dt1VTrC/+qAd1MLdkGQRt/Ab5JqtqF2s5
	fzdvzea2w79jWrC6IzVwWiTW/0gc497Cr5Ltf8twwfCpSWWjZuuN1JNeZuy3yONsZr2S
	7MZ36afFwTyclUPtGjTqDHpRJ9SPrBxKnIOGdeChrjBLRjUxZe0a4kYV2mZ+ULDVb2Ya
	dw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S879pAUDXjKcHIJ4zlhIeIy0C2Fm7dxYfIo50MEyrSM=;
	b=B/PT0miGgyqv2bihLOVu4dYb+UW9m6CPvHrjPqnRa8i8pe7SF4V4p/u9zFaN77rF+7
	7q/poyAP474jwDRE7Hcm6o5klVr4CxndDmmpK9hWaq0P+kl+gXKVpZvBdVWxY0+HYDrR
	fgg8rqcx6kJrAEpa9rMzKX8dgLcvDZLYbx5WOMSXh0CrGlLzBAUVRTJUL5Hp+y7sTNpS
	wQFTFEwR9dJVg+FGE4yWmUmBjCQPgTlXcgq+C1E+SrvSnQwm8MvtdcVgEJvZ8BfudX7A
	o0HHbfSzvRG7rnziqW5a2Qv8jwSC2tD+900iHxKA2dqatHehXhcbvDUVNp6YlZBcboQ7
	B2TQ==
X-Gm-Message-State: AKwxytdWUg8R2sHQ01ltLyd9YXXTuh3uzVqaKK4rmtHyFd+fuQvZMFqe
	xnrFb9ZxHRTvkK/Z1dw4kSSHVbYCBk0iRepv22d7pBgJ
X-Google-Smtp-Source: AH8x225+9EjYqaOFalHBEQyIIkQpqv4QpKzMAOQ57Un7FJbQXcBDZYc8XHGgvizhTOUrXc15WE06UGwWvLwCzSF/6lM=
X-Received: by 10.36.228.197 with SMTP id o188mr14385124ith.85.1517401744969; 
	Wed, 31 Jan 2018 04:29:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 04:28:44 -0800 (PST)
In-Reply-To: <2966cc751ff78de85ebac9776f78204c3cea0267.1517383469.git.hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<2966cc751ff78de85ebac9776f78204c3cea0267.1517383469.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 12:28:44 +0000
Message-ID: <CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gpgme: 1.9.0 -> 1.10.0
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
X-List-Received-Date: Wed, 31 Jan 2018 12:29:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c1253d0fdaa080564119f07"

--94eb2c1253d0fdaa080564119f07
Content-Type: text/plain; charset="UTF-8"

On 31 January 2018 at 07:48, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> 1. Disable test at build time to workaround corss-compile
>

Looks like more tests need to be disabled:

| Making all in tests
| make[4]: Entering directory
'/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests'
| echo no-force-v3-sigs > ./gpg.conf
| echo pinentry-program
/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/../gpgme-1.10.0/tests/gpg/pinentry
>gpg-agent.conf
| gpgconf --kill all
| echo ignore-invalid-option agent-program >> ./gpg.conf
| /bin/bash: gpgconf: command not found
| Makefile:611: recipe for target 'private-keys-v1.d/gpg-sample.stamp'
failed
| make[4]: [private-keys-v1.d/gpg-sample.stamp] Error 127 (ignored)
| /data/poky-tmp/master/hosttools/mkdir -p ./private-keys-v1.d
| echo "agent-program `which gpg-agent`|--debug-quick-random" >> ./gpg.conf
| for k in
../../../../gpgme-1.10.0/tests/gpg/13CD0F3BDF24BE53FE192D62F18737256FF6E4FD
../../../../gpgme-1.10.0/tests/gpg/76F7E2B35832976B50A27A282D9B87E44577EB66
../../../../gpgme-1.10.0/tests/gpg/A0747D5F9425E6664F4FFBEED20FBCA79FDED2BD
../../../../gpgme-1.10.0/tests/gpg/13CBE3758AFE42B5E5E2AE4CED27AFA455E3F87F
../../../../gpgme-1.10.0/tests/gpg/7A030357C0F253A5BBCD282FFC4E521B37558F5C;
do \
|           cp $k
private-keys-v1.d/${k#../../../../gpgme-1.10.0/tests/gpg/}.key; \
|         done
| echo x > ./private-keys-v1.d/gpg-sample.stamp
| gpg --batch --no-permission-warning \
|                --import ../../../../gpgme-1.10.0/tests/gpg/pubdemo.asc
| gpg: keybox
'/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests/pubring.kbx'
created
| gpg:
/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests/trustdb.gpg:
trustdb created
| gpg: key 2D727CC768697734: public key "Alfa Test (demo key) <
alfa@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key FE180B1DA9E3B0B2: public key "Bob (demo key)" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 413F4AF31AFDAB6C: public key "Charlie Test (demo key) <
charlie@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key EBA9F240EB9DC9E6: public key "Delta Test (demo key) <
delta@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 318C1FAEFAEF6D1B: public key "Echelon (demo key)" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key D4BF57F37372E243: public key "Foxtrot Test (demo key) <
foxtrot@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 168410A48FC282E6: public key "Golf Test (demo key) <
golf@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 13DB965534C6E3F1: public key "Hotel Test (demo key) <
hotel@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 1FE8FC6F04259677: public key "India Test (demo key) <
india@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 0C820C71D2699313: public key "Juliet Test (demo key) <
juliet@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key AD1B0FAD43C2D0C7: public key "Kilo Test (demo key) <
kilo@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 37CAB51FB79103F8: public key "Lima Test (demo key) <
lima@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key BE794852BE5CF886: public key "Mallory (demo key)" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 25B00FD430CEC684: public key "November Test (demo key) <
november@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 5F6356BA6D9732AC: public key "Oscar Test (demo key) <
oscar@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 5D15E01D3FF13206: public key "Papa test (demo key) <
papa@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 1C67EC133C661C84: public key "Quebec Test (demo key) <
quebec@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 3BDBEDB1777FBED3: public key "Romeo Test (demo key) <
romeo@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key A5E67F7FA3AE3EA1: public key "Sierra Test (demo key) <
sierra@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 58CB9A4C85A81F38: public key "Tango Test (demo key) <
tango@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key A94C0F75653244D6: public key "Uniform Test (demo key) <
uniform@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 47AF4B6961F04784: public key "Victor Test (demo key) <
victor@example.org>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key DEF0F7B8EC67DBDE: public key "Whisky Test (demo key) <
whisky@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 8979A6C5567FB34A: public key "XRay Test (demo key) <
xray@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 9EEF34CD4B11B25F: public key "Yankee Test (demo key) <
yankee@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: key 6BC4778054ACD246: public key "Zulu Test (demo key) <
zulu@example.net>" imported
| gpg: failed to start agent '|--debug-quick-random': No such file or
directory
| gpg: can't connect to the agent: No such file or directory
| gpg: Total number processed: 26
| gpg:               imported: 26
| Makefile:620: recipe for target 'pubring-stamp' failed

Ross

--94eb2c1253d0fdaa080564119f07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 January 2018 at 07:48, Hongxu Jia <span dir=3D"ltr">=
&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.ji=
a@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">1. Disable test at build time to worka=
round corss-compile<br></blockquote><div><br></div><div>Looks like more tes=
ts need to be disabled:</div><div><br></div><div>| Making all in tests</div=
><div>| make[4]: Entering directory &#39;/data/poky-tmp/master/work/corei7-=
64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests&#39;</div><div>| echo=
 no-force-v3-sigs &gt; ./gpg.conf</div><div>| echo pinentry-program /data/p=
oky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/../gpgme-1.1=
0.0/tests/gpg/pinentry &gt;gpg-agent.conf</div><div>| gpgconf --kill all</d=
iv><div>| echo ignore-invalid-option agent-program &gt;&gt; ./gpg.conf</div=
><div>| /bin/bash: gpgconf: command not found</div><div>| Makefile:611: rec=
ipe for target &#39;private-keys-v1.d/gpg-sample.stamp&#39; failed</div><di=
v>| make[4]: [private-keys-v1.d/gpg-sample.stamp] Error 127 (ignored)</div>=
<div>| /data/poky-tmp/master/hosttools/mkdir -p ./private-keys-v1.d</div><d=
iv>| echo &quot;agent-program `which gpg-agent`|--debug-quick-random&quot; =
&gt;&gt; ./gpg.conf</div><div>| for k in ../../../../gpgme-1.10.0/tests/gpg=
/13CD0F3BDF24BE53FE192D62F18737256FF6E4FD ../../../../gpgme-1.10.0/tests/gp=
g/76F7E2B35832976B50A27A282D9B87E44577EB66 ../../../../gpgme-1.10.0/tests/g=
pg/A0747D5F9425E6664F4FFBEED20FBCA79FDED2BD ../../../../gpgme-1.10.0/tests/=
gpg/13CBE3758AFE42B5E5E2AE4CED27AFA455E3F87F ../../../../gpgme-1.10.0/tests=
/gpg/7A030357C0F253A5BBCD282FFC4E521B37558F5C; do \</div><div>| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cp $k private-keys-v1.d/${k#../../../../gpgme-1.10=
.0/tests/gpg/}.key; \</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 done</div><di=
v>| echo x &gt; ./private-keys-v1.d/gpg-sample.stamp</div><div>| gpg --batc=
h --no-permission-warning \</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0--import ../../../../gpgme-1.10.0/tests/gpg/pubdemo.asc=
</div><div>| gpg: keybox &#39;/data/poky-tmp/master/work/corei7-64-poky-lin=
ux/gpgme/1.10.0-r0/build/lang/python/tests/pubring.kbx&#39; created</div><d=
iv>| gpg: /data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/b=
uild/lang/python/tests/trustdb.gpg: trustdb created</div><div>| gpg: key 2D=
727CC768697734: public key &quot;Alfa Test (demo key) &lt;<a href=3D"mailto=
:alfa@example.net">alfa@example.net</a>&gt;&quot; imported</div><div>| gpg:=
 failed to start agent &#39;|--debug-quick-random&#39;: No such file or dir=
ectory</div><div>| gpg: can&#39;t connect to the agent: No such file or dir=
ectory</div><div>| gpg: key FE180B1DA9E3B0B2: public key &quot;Bob (demo ke=
y)&quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-quic=
k-random&#39;: No such file or directory</div><div>| gpg: can&#39;t connect=
 to the agent: No such file or directory</div><div>| gpg: key 413F4AF31AFDA=
B6C: public key &quot;Charlie Test (demo key) &lt;<a href=3D"mailto:charlie=
@example.net">charlie@example.net</a>&gt;&quot; imported</div><div>| gpg: f=
ailed to start agent &#39;|--debug-quick-random&#39;: No such file or direc=
tory</div><div>| gpg: can&#39;t connect to the agent: No such file or direc=
tory</div><div>| gpg: key EBA9F240EB9DC9E6: public key &quot;Delta Test (de=
mo key) &lt;<a href=3D"mailto:delta@example.net">delta@example.net</a>&gt;&=
quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-quick-r=
andom&#39;: No such file or directory</div><div>| gpg: can&#39;t connect to=
 the agent: No such file or directory</div><div>| gpg: key 318C1FAEFAEF6D1B=
: public key &quot;Echelon (demo key)&quot; imported</div><div>| gpg: faile=
d to start agent &#39;|--debug-quick-random&#39;: No such file or directory=
</div><div>| gpg: can&#39;t connect to the agent: No such file or directory=
</div><div>| gpg: key D4BF57F37372E243: public key &quot;Foxtrot Test (demo=
 key) &lt;<a href=3D"mailto:foxtrot@example.net">foxtrot@example.net</a>&gt=
;&quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-quick=
-random&#39;: No such file or directory</div><div>| gpg: can&#39;t connect =
to the agent: No such file or directory</div><div>| gpg: key 168410A48FC282=
E6: public key &quot;Golf Test (demo key) &lt;<a href=3D"mailto:golf@exampl=
e.net">golf@example.net</a>&gt;&quot; imported</div><div>| gpg: failed to s=
tart agent &#39;|--debug-quick-random&#39;: No such file or directory</div>=
<div>| gpg: can&#39;t connect to the agent: No such file or directory</div>=
<div>| gpg: key 13DB965534C6E3F1: public key &quot;Hotel Test (demo key) &l=
t;<a href=3D"mailto:hotel@example.net">hotel@example.net</a>&gt;&quot; impo=
rted</div><div>| gpg: failed to start agent &#39;|--debug-quick-random&#39;=
: No such file or directory</div><div>| gpg: can&#39;t connect to the agent=
: No such file or directory</div><div>| gpg: key 1FE8FC6F04259677: public k=
ey &quot;India Test (demo key) &lt;<a href=3D"mailto:india@example.net">ind=
ia@example.net</a>&gt;&quot; imported</div><div>| gpg: failed to start agen=
t &#39;|--debug-quick-random&#39;: No such file or directory</div><div>| gp=
g: can&#39;t connect to the agent: No such file or directory</div><div>| gp=
g: key 0C820C71D2699313: public key &quot;Juliet Test (demo key) &lt;<a hre=
f=3D"mailto:juliet@example.net">juliet@example.net</a>&gt;&quot; imported</=
div><div>| gpg: failed to start agent &#39;|--debug-quick-random&#39;: No s=
uch file or directory</div><div>| gpg: can&#39;t connect to the agent: No s=
uch file or directory</div><div>| gpg: key AD1B0FAD43C2D0C7: public key &qu=
ot;Kilo Test (demo key) &lt;<a href=3D"mailto:kilo@example.net">kilo@exampl=
e.net</a>&gt;&quot; imported</div><div>| gpg: failed to start agent &#39;|-=
-debug-quick-random&#39;: No such file or directory</div><div>| gpg: can&#3=
9;t connect to the agent: No such file or directory</div><div>| gpg: key 37=
CAB51FB79103F8: public key &quot;Lima Test (demo key) &lt;<a href=3D"mailto=
:lima@example.net">lima@example.net</a>&gt;&quot; imported</div><div>| gpg:=
 failed to start agent &#39;|--debug-quick-random&#39;: No such file or dir=
ectory</div><div>| gpg: can&#39;t connect to the agent: No such file or dir=
ectory</div><div>| gpg: key BE794852BE5CF886: public key &quot;Mallory (dem=
o key)&quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-=
quick-random&#39;: No such file or directory</div><div>| gpg: can&#39;t con=
nect to the agent: No such file or directory</div><div>| gpg: key 25B00FD43=
0CEC684: public key &quot;November Test (demo key) &lt;<a href=3D"mailto:no=
vember@example.net">november@example.net</a>&gt;&quot; imported</div><div>|=
 gpg: failed to start agent &#39;|--debug-quick-random&#39;: No such file o=
r directory</div><div>| gpg: can&#39;t connect to the agent: No such file o=
r directory</div><div>| gpg: key 5F6356BA6D9732AC: public key &quot;Oscar T=
est (demo key) &lt;<a href=3D"mailto:oscar@example.net">oscar@example.net</=
a>&gt;&quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-=
quick-random&#39;: No such file or directory</div><div>| gpg: can&#39;t con=
nect to the agent: No such file or directory</div><div>| gpg: key 5D15E01D3=
FF13206: public key &quot;Papa test (demo key) &lt;<a href=3D"mailto:papa@e=
xample.net">papa@example.net</a>&gt;&quot; imported</div><div>| gpg: failed=
 to start agent &#39;|--debug-quick-random&#39;: No such file or directory<=
/div><div>| gpg: can&#39;t connect to the agent: No such file or directory<=
/div><div>| gpg: key 1C67EC133C661C84: public key &quot;Quebec Test (demo k=
ey) &lt;<a href=3D"mailto:quebec@example.net">quebec@example.net</a>&gt;&qu=
ot; imported</div><div>| gpg: failed to start agent &#39;|--debug-quick-ran=
dom&#39;: No such file or directory</div><div>| gpg: can&#39;t connect to t=
he agent: No such file or directory</div><div>| gpg: key 3BDBEDB1777FBED3: =
public key &quot;Romeo Test (demo key) &lt;<a href=3D"mailto:romeo@example.=
net">romeo@example.net</a>&gt;&quot; imported</div><div>| gpg: failed to st=
art agent &#39;|--debug-quick-random&#39;: No such file or directory</div><=
div>| gpg: can&#39;t connect to the agent: No such file or directory</div><=
div>| gpg: key A5E67F7FA3AE3EA1: public key &quot;Sierra Test (demo key) &l=
t;<a href=3D"mailto:sierra@example.net">sierra@example.net</a>&gt;&quot; im=
ported</div><div>| gpg: failed to start agent &#39;|--debug-quick-random&#3=
9;: No such file or directory</div><div>| gpg: can&#39;t connect to the age=
nt: No such file or directory</div><div>| gpg: key 58CB9A4C85A81F38: public=
 key &quot;Tango Test (demo key) &lt;<a href=3D"mailto:tango@example.net">t=
ango@example.net</a>&gt;&quot; imported</div><div>| gpg: failed to start ag=
ent &#39;|--debug-quick-random&#39;: No such file or directory</div><div>| =
gpg: can&#39;t connect to the agent: No such file or directory</div><div>| =
gpg: key A94C0F75653244D6: public key &quot;Uniform Test (demo key) &lt;<a =
href=3D"mailto:uniform@example.net">uniform@example.net</a>&gt;&quot; impor=
ted</div><div>| gpg: failed to start agent &#39;|--debug-quick-random&#39;:=
 No such file or directory</div><div>| gpg: can&#39;t connect to the agent:=
 No such file or directory</div><div>| gpg: key 47AF4B6961F04784: public ke=
y &quot;Victor Test (demo key) &lt;<a href=3D"mailto:victor@example.org">vi=
ctor@example.org</a>&gt;&quot; imported</div><div>| gpg: failed to start ag=
ent &#39;|--debug-quick-random&#39;: No such file or directory</div><div>| =
gpg: can&#39;t connect to the agent: No such file or directory</div><div>| =
gpg: key DEF0F7B8EC67DBDE: public key &quot;Whisky Test (demo key) &lt;<a h=
ref=3D"mailto:whisky@example.net">whisky@example.net</a>&gt;&quot; imported=
</div><div>| gpg: failed to start agent &#39;|--debug-quick-random&#39;: No=
 such file or directory</div><div>| gpg: can&#39;t connect to the agent: No=
 such file or directory</div><div>| gpg: key 8979A6C5567FB34A: public key &=
quot;XRay Test (demo key) &lt;<a href=3D"mailto:xray@example.net">xray@exam=
ple.net</a>&gt;&quot; imported</div><div>| gpg: failed to start agent &#39;=
|--debug-quick-random&#39;: No such file or directory</div><div>| gpg: can&=
#39;t connect to the agent: No such file or directory</div><div>| gpg: key =
9EEF34CD4B11B25F: public key &quot;Yankee Test (demo key) &lt;<a href=3D"ma=
ilto:yankee@example.net">yankee@example.net</a>&gt;&quot; imported</div><di=
v>| gpg: failed to start agent &#39;|--debug-quick-random&#39;: No such fil=
e or directory</div><div>| gpg: can&#39;t connect to the agent: No such fil=
e or directory</div><div>| gpg: key 6BC4778054ACD246: public key &quot;Zulu=
 Test (demo key) &lt;<a href=3D"mailto:zulu@example.net">zulu@example.net</=
a>&gt;&quot; imported</div><div>| gpg: failed to start agent &#39;|--debug-=
quick-random&#39;: No such file or directory</div><div>| gpg: can&#39;t con=
nect to the agent: No such file or directory</div><div>| gpg: Total number =
processed: 26</div><div>| gpg: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 imported: 26</div><div>| Makefile:620: recipe for target &#39;pubrin=
g-stamp&#39; failed</div><div><br></div><div>Ross=C2=A0</div></div></div></=
div>

--94eb2c1253d0fdaa080564119f07--
