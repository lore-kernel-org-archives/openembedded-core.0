Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB7FC47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 07:51:55 +0000 (UTC)
Subject: Re: How to enable libstdc++ Pretty Printers in GDB #poky
To: openembedded-core@lists.openembedded.org
From: "Rahul Chauhan" <rahulchauhankitps@gmail.com>
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.4)
X-Originating-Platform: Windows Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Jan 2024 23:51:52 -0800
References: <10032.1706678833265291851@lists.openembedded.org>
In-Reply-To: <10032.1706678833265291851@lists.openembedded.org>
Message-ID: <10032.1706687512615914058@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nX6uddnfhFIq4X030Qo5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 07:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194511

--nX6uddnfhFIq4X030Qo5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

I noti ced that whe n I chec k th e in fo p rett y-pr inte r co mman d ou t=
put aft er l oadi ng t he t est appl icat ion with gdb ,
it is show ing the expe cted beh avio r. T his mean s th at e very thin g s=
e ems to b e fu ncti onin g co rrec tly in t hat aspe ct.

Thanks for your support.

bash-5.1# gdb -q test
Reading symbols from test...
(gdb) b 12
Breakpoint 1 at 0x234e: file test.cpp, line 12.
(gdb) r
Starting program: /test
warning: Error disabling address space randomization: Operation not permitt=
ed
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".

Breakpoint 1, main () at test.cpp:12
12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
(gdb) p s
$1 =3D "test"
(gdb) p vi
$2 =3D std::vector of length 3, capacity 4 =3D {1, 2, 3}
(gdb) info pretty-printer
global pretty-printers:
builtin
mpx_bound128
objfile /lib/libstdc++.so.6 pretty-printers:
libstdc++-v6
__gnu_cxx::_Slist_iterator
__gnu_cxx::__8::_Slist_iterator
__gnu_cxx::__8::__normal_iterator
__gnu_cxx::__8::slist
__gnu_cxx::__normal_iterator
__gnu_cxx::slist
__gnu_debug::_Safe_iterator
std::_Bit_const_iterator
std::_Bit_iterator
std::_Bit_reference
std::_Deque_const_iterator
std::_Deque_iterator
std::_Fwd_list_const_iterator
std::_Fwd_list_iterator
std::_List_const_iterator
std::_List_iterator
std::_Node_handle
std::_Rb_tree_const_iterator
std::_Rb_tree_iterator
std::__8::_Bit_const_iterator
std::__8::_Bit_iterator
std::__8::_Bit_reference
std::__8::_Deque_const_iterator
std::__8::_Deque_iterator
std::__8::_Fwd_list_const_iterator
std::__8::_Fwd_list_iterator
std::__8::_List_const_iterator
std::__8::_List_iterator
std::__8::_Node_handle
std::__8::_Rb_tree_const_iterator
std::__8::_Rb_tree_iterator
std::__8::__cxx11::__cxx1998::list
std::__8::__cxx11::basic_string
std::__8::__cxx11::list
std::__8::__cxx1998::_Bit_const_iterator
std::__8::__cxx1998::_Bit_iterator
std::__8::__cxx1998::_Bit_reference
std::__8::__cxx1998::_Deque_const_iterator
std::__8::__cxx1998::_Deque_iterator
std::__8::__cxx1998::_Fwd_list_const_iterator
std::__8::__cxx1998::_Fwd_list_iterator
std::__8::__cxx1998::_List_const_iterator
std::__8::__cxx1998::_List_iterator
std::__8::__cxx1998::bitset
std::__8::__cxx1998::deque
std::__8::__cxx1998::forward_list

--nX6uddnfhFIq4X030Qo5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,<br /><br /><span style=3D"box-sizing: inherit; animation: 0.7s=
 cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474=
340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-s=
pace-collapse: preserve-breaks;">I </span><span style=3D"box-sizing: inheri=
t; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running l=
bWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-spacing:=
 -0.225px; white-space-collapse: preserve-breaks;">noti</span><span style=
=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1=
 normal none running lbWRkT; color: #474340; font-family: Inter; font-size:=
 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">ce=
d </span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0=
.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-famil=
y: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: =
preserve-breaks;">that</span><span style=3D"box-sizing: inherit; animation:=
 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color:=
 #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; wh=
ite-space-collapse: preserve-breaks;"> whe</span><span style=3D"box-sizing:=
 inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none ru=
nning lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-s=
pacing: -0.225px; white-space-collapse: preserve-breaks;">n I </span><span =
style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0)=
 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; font-=
size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks=
;">chec</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bez=
ier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-=
family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-colla=
pse: preserve-breaks;">k th</span><span style=3D"box-sizing: inherit; anima=
tion: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; c=
olor: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225p=
x; white-space-collapse: preserve-breaks;">e in</span><span style=3D"box-si=
zing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal no=
ne running lbWRkT; color: #474340; font-family: Inter; font-size: 15px; let=
ter-spacing: -0.225px; white-space-collapse: preserve-breaks;">fo p</span><=
span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.8=
4, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; =
font-size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-b=
reaks;">rett</span><span style=3D"box-sizing: inherit; animation: 0.7s cubi=
c-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; =
font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-=
collapse: preserve-breaks;">y-pr</span><span style=3D"box-sizing: inherit; =
animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWR=
kT; color: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0=
.225px; white-space-collapse: preserve-breaks;">inte</span><span style=3D"b=
ox-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 norm=
al none running lbWRkT; color: #474340; font-family: Inter; font-size: 15px=
; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">r co</s=
pan><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0=
, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: In=
ter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: prese=
rve-breaks;">mman</span><span style=3D"box-sizing: inherit; animation: 0.7s=
 cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474=
340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-s=
pace-collapse: preserve-breaks;">d ou</span><span style=3D"box-sizing: inhe=
rit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running=
 lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-spacin=
g: -0.225px; white-space-collapse: preserve-breaks;">tput</span><span style=
=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1=
 normal none running lbWRkT; color: #474340; font-family: Inter; font-size:=
 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;"> a=
ft</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0=
.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-famil=
y: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: =
preserve-breaks;">er l</span><span style=3D"box-sizing: inherit; animation:=
 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color:=
 #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; wh=
ite-space-collapse: preserve-breaks;">oadi</span><span style=3D"box-sizing:=
 inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none ru=
nning lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-s=
pacing: -0.225px; white-space-collapse: preserve-breaks;">ng t</span><span =
style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0)=
 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; font-=
size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks=
;">he t</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bez=
ier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-=
family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-colla=
pse: preserve-breaks;">est </span><span style=3D"box-sizing: inherit; anima=
tion: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; c=
olor: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225p=
x; white-space-collapse: preserve-breaks;">appl</span><span style=3D"box-si=
zing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal no=
ne running lbWRkT; color: #474340; font-family: Inter; font-size: 15px; let=
ter-spacing: -0.225px; white-space-collapse: preserve-breaks;">icat</span><=
span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.8=
4, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; =
font-size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-b=
reaks;">ion </span><span style=3D"box-sizing: inherit; animation: 0.7s cubi=
c-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; =
font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-=
collapse: preserve-breaks;">with</span><span style=3D"box-sizing: inherit; =
animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWR=
kT; color: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0=
.225px; white-space-collapse: preserve-breaks;"> gdb</span><span style=3D"b=
ox-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 norm=
al none running lbWRkT; color: #474340; font-family: Inter; font-size: 15px=
; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">,<br />=
it</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0=
.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-famil=
y: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: =
preserve-breaks;"> is </span><span style=3D"box-sizing: inherit; animation:=
 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color:=
 #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; wh=
ite-space-collapse: preserve-breaks;">show</span><span style=3D"box-sizing:=
 inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none ru=
nning lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-s=
pacing: -0.225px; white-space-collapse: preserve-breaks;">ing </span><span =
style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0)=
 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; font-=
size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks=
;">the </span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bez=
ier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-=
family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-colla=
pse: preserve-breaks;">expe</span><span style=3D"box-sizing: inherit; anima=
tion: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; c=
olor: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225p=
x; white-space-collapse: preserve-breaks;">cted</span><span style=3D"box-si=
zing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal no=
ne running lbWRkT; color: #474340; font-family: Inter; font-size: 15px; let=
ter-spacing: -0.225px; white-space-collapse: preserve-breaks;"> beh</span><=
span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.8=
4, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; =
font-size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-b=
reaks;">avio</span><span style=3D"box-sizing: inherit; animation: 0.7s cubi=
c-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; =
font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-=
collapse: preserve-breaks;">r. T</span><span style=3D"box-sizing: inherit; =
animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWR=
kT; color: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0=
.225px; white-space-collapse: preserve-breaks;">his </span><span style=3D"b=
ox-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 norm=
al none running lbWRkT; color: #474340; font-family: Inter; font-size: 15px=
; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">mean</s=
pan><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0=
, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: In=
ter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: prese=
rve-breaks;">s th</span><span style=3D"box-sizing: inherit; animation: 0.7s=
 cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474=
340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-s=
pace-collapse: preserve-breaks;">at e</span><span style=3D"box-sizing: inhe=
rit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running=
 lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-spacin=
g: -0.225px; white-space-collapse: preserve-breaks;">very</span><span style=
=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1=
 normal none running lbWRkT; color: #474340; font-family: Inter; font-size:=
 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">th=
in</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0=
.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-famil=
y: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: =
preserve-breaks;">g se</span><span style=3D"box-sizing: inherit; animation:=
 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color:=
 #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; wh=
ite-space-collapse: preserve-breaks;">ems </span><span style=3D"box-sizing:=
 inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none ru=
nning lbWRkT; color: #474340; font-family: Inter; font-size: 15px; letter-s=
pacing: -0.225px; white-space-collapse: preserve-breaks;">to b</span><span =
style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0)=
 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; font-=
size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-breaks=
;">e fu</span><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bez=
ier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-=
family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-colla=
pse: preserve-breaks;">ncti</span><span style=3D"box-sizing: inherit; anima=
tion: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; c=
olor: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0.225p=
x; white-space-collapse: preserve-breaks;">onin</span><span style=3D"box-si=
zing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal no=
ne running lbWRkT; color: #474340; font-family: Inter; font-size: 15px; let=
ter-spacing: -0.225px; white-space-collapse: preserve-breaks;">g co</span><=
span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.8=
4, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: Inter; =
font-size: 15px; letter-spacing: -0.225px; white-space-collapse: preserve-b=
reaks;">rrec</span><span style=3D"box-sizing: inherit; animation: 0.7s cubi=
c-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; =
font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-space-=
collapse: preserve-breaks;">tly </span><span style=3D"box-sizing: inherit; =
animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWR=
kT; color: #474340; font-family: Inter; font-size: 15px; letter-spacing: -0=
.225px; white-space-collapse: preserve-breaks;">in t</span><span style=3D"b=
ox-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0, 0.84, 0) 0s 1 norm=
al none running lbWRkT; color: #474340; font-family: Inter; font-size: 15px=
; letter-spacing: -0.225px; white-space-collapse: preserve-breaks;">hat </s=
pan><span style=3D"box-sizing: inherit; animation: 0.7s cubic-bezier(0.7, 0=
, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474340; font-family: In=
ter; font-size: 15px; letter-spacing: -0.225px; white-space-collapse: prese=
rve-breaks;">aspe</span><span style=3D"box-sizing: inherit; animation: 0.7s=
 cubic-bezier(0.7, 0, 0.84, 0) 0s 1 normal none running lbWRkT; color: #474=
340; font-family: Inter; font-size: 15px; letter-spacing: -0.225px; white-s=
pace-collapse: preserve-breaks;">ct.<br /><br /></span>Thanks for your supp=
ort.<br /><br />
<div>bash-5.1# gdb -q test</div>
<div>Reading symbols from test...</div>
<div>(gdb) b 12</div>
<div>Breakpoint 1 at 0x234e: file test.cpp, line 12.</div>
<div>(gdb) r</div>
<div>Starting program: /test</div>
<div>warning: Error disabling address space randomization: Operation not pe=
rmitted</div>
<div>[Thread debugging using libthread_db enabled]</div>
<div>Using host libthread_db library "/lib/libthread_db.so.1".</div>
<div>&nbsp;</div>
<div>Breakpoint 1, main () at test.cpp:12</div>
<div>12&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;</div>
<div>(gdb) p s</div>
<div>$1 =3D "test"</div>
<div>(gdb) p vi</div>
<div>$2 =3D std::vector of length 3, capacity 4 =3D {1, 2, 3}</div>
<div>(gdb) info pretty-printer</div>
<div>global pretty-printers:</div>
<div>&nbsp; builtin</div>
<div>&nbsp; &nbsp; mpx_bound128</div>
<div>objfile /lib/libstdc++.so.6 pretty-printers:</div>
<div>&nbsp; libstdc++-v6</div>
<div>&nbsp; &nbsp; __gnu_cxx::_Slist_iterator</div>
<div>&nbsp; &nbsp; __gnu_cxx::__8::_Slist_iterator</div>
<div>&nbsp; &nbsp; __gnu_cxx::__8::__normal_iterator</div>
<div>&nbsp; &nbsp; __gnu_cxx::__8::slist</div>
<div>&nbsp; &nbsp; __gnu_cxx::__normal_iterator</div>
<div>&nbsp; &nbsp; __gnu_cxx::slist</div>
<div>&nbsp; &nbsp; __gnu_debug::_Safe_iterator</div>
<div>&nbsp; &nbsp; std::_Bit_const_iterator</div>
<div>&nbsp; &nbsp; std::_Bit_iterator</div>
<div>&nbsp; &nbsp; std::_Bit_reference</div>
<div>&nbsp; &nbsp; std::_Deque_const_iterator</div>
<div>&nbsp; &nbsp; std::_Deque_iterator</div>
<div>&nbsp; &nbsp; std::_Fwd_list_const_iterator</div>
<div>&nbsp; &nbsp; std::_Fwd_list_iterator</div>
<div>&nbsp; &nbsp; std::_List_const_iterator</div>
<div>&nbsp; &nbsp; std::_List_iterator</div>
<div>&nbsp; &nbsp; std::_Node_handle</div>
<div>&nbsp; &nbsp; std::_Rb_tree_const_iterator</div>
<div>&nbsp; &nbsp; std::_Rb_tree_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Bit_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Bit_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Bit_reference</div>
<div>&nbsp; &nbsp; std::__8::_Deque_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Deque_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Fwd_list_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Fwd_list_iterator</div>
<div>&nbsp; &nbsp; std::__8::_List_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::_List_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Node_handle</div>
<div>&nbsp; &nbsp; std::__8::_Rb_tree_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::_Rb_tree_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx11::__cxx1998::list</div>
<div>&nbsp; &nbsp; std::__8::__cxx11::basic_string</div>
<div>&nbsp; &nbsp; std::__8::__cxx11::list</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Bit_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Bit_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Bit_reference</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Deque_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Deque_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Fwd_list_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_Fwd_list_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_List_const_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::_List_iterator</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::bitset</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::deque</div>
<div>&nbsp; &nbsp; std::__8::__cxx1998::forward_list</div>

--nX6uddnfhFIq4X030Qo5--

