Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0KbY-00056X-U0
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 00:28:48 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so453164dam.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 15:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MobGj5tmlnAwglemRwu+lulkyd0uLU0Cmwdv2cniucc=;
	b=QzVJToFO+0EBPWXREnnMB5iHUyPHsnZ+R3apgdzpdgQA9tQihC1aic6TlcqK883/rz
	nX5R61EG/7AFijDyNPDJd2I+VwwYfkv1RHQWCDVbr4BBctEXSXnByZASDvgbq9tXrhwo
	2iK2r1Ftdzi4UJHNXcWVsNm72BaDLadnDrkVhYhP+tFFeLCg3+/sgh6y6R2wTcfh95Fb
	Keb/71bYXa6WC5cVJ04O4lZWz7Kwjg8L6Y1yP7Lk3HVxA2UsmsHE2CtmJo+ecASR6MiB
	enpHhvGVr8n2+h0dUwDCuOQWywvgfAlb/ySeM5AVT3vKUspVf4+0eWe04af4dqJ/cpj6
	rUzQ==
X-Received: by 10.68.135.99 with SMTP id pr3mr6640595pbb.151.1359501179890;
	Tue, 29 Jan 2013 15:12:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gl10sm119575pbc.41.2013.01.29.15.12.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 15:12:58 -0800 (PST)
Date: Wed, 30 Jan 2013 00:12:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130129231254.GU16904@jama.palm1.palmone.com>
References: <20130129144900.GO16904@jama.palm1.palmone.com>
	<20130129202630.GR16904@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130129202630.GR16904@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OSError: [Errno 7] Argument list too long in sstate_install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 23:28:48 -0000
X-Groupsio-MsgNum: 34674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jnHBos+GICmmswJV"
Content-Disposition: inline

--jnHBos+GICmmswJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 09:26:30PM +0100, Martin Jansa wrote:
> On Tue, Jan 29, 2013 at 03:49:00PM +0100, Martin Jansa wrote:
> > When building bigger world-image I always get this error from
> > populate_lic. There is debug output to show what copytree/Popen/execute=
_child=20
> > was calling and it looks OK to me.
>=20

Strace from both tar calls look good to me:
copytree cmd 'strace tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-dest=
dir -ps . 2>~/strace.tar1.log | tar -xf - -C /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/deploy/licenses 2> ~/strace.tar2.log'

strace from 1st tar:
execve("/bin/tar", ["tar", "-cf", "-", "-C", "/home/jenkins/oe/shr-core-bra=
nch"..., "-ps", "."], [/* 83 vars */]) =3D 0
brk(0)                                  =3D 0xe74000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f8010188000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/x86_64/librt.so.1", O_RDONLY|O_CLOEXE=
C) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/x86_64", 0x7fff1a9c4180) =3D -1 ENOEN=
T (No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/librt.so.1", O_RDONLY|O_CLOEXEC) =3D =
-1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls", 0x7fff1a9c4180) =3D -1 ENOENT (No s=
uch file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/x86_64/librt.so.1", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/x86_64", 0x7fff1a9c4180) =3D -1 ENOENT (N=
o such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/librt.so.1", O_RDONLY|O_CLOEXEC) =3D -1 E=
NOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib", 0x7fff1a9c4180) =3D -1 ENOENT (No such =
file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/x86_64/librt.so.1", O_RDONLY|O_CLOE=
XEC) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/x86_64", 0x7fff1a9c4180) =3D -1 ENO=
ENT (No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/librt.so.1", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls", 0x7fff1a9c4180) =3D -1 ENOENT (No=
 such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/x86_64/librt.so.1", O_RDONLY|O_CLOEXEC)=
 =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/x86_64", 0x7fff1a9c4180) =3D -1 ENOENT =
(No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/librt.so.1", O_RDONLY|O_CLOEXEC) =3D -1=
 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64", {st_mode=3DS_IFDIR|0755, st_size=3D60=
, ...}) =3D 0
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 10
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 10, 0) =3D 0x7f801017d000
close(10)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/librt.so.1", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340!\0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D31752, ...}) =3D 0
mmap(NULL, 2128984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f800fd60000
mprotect(0x7f800fd67000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800ff66000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x6000) =3D 0x7f800ff66000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) =3D -1 =
ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200\30\2\0\0\0\0\0=
"..., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0755, st_size=3D1802936, ...}) =3D 0
mmap(NULL, 3917016, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f800f9a3000
mprotect(0x7f800fb56000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800fd55000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 10, 0x1b2000) =3D 0x7f800fd55000
mmap(0x7f800fd5b000, 17624, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x7f800fd5b000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200l\0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0755, st_size=3D135366, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f801017c000
mmap(NULL, 2212904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f800f786000
mprotect(0x7f800f79e000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800f99d000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x17000) =3D 0x7f800f99d000
mmap(0x7f800f99f000, 13352, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x7f800f99f000
close(10)                               =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f801017b000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f801017a000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f8010179000
arch_prctl(ARCH_SET_FS, 0x7f801017a700) =3D 0
mprotect(0x7f800fd55000, 16384, PROT_READ) =3D 0
mprotect(0x7f800f99d000, 4096, PROT_READ) =3D 0
mprotect(0x7f800ff66000, 4096, PROT_READ) =3D 0
mprotect(0x647000, 4096, PROT_READ)     =3D 0
mprotect(0x7f801018a000, 4096, PROT_READ) =3D 0
munmap(0x7f801017d000, 41689)           =3D 0
set_tid_address(0x7f801017a9d0)         =3D 5075
set_robust_list(0x7f801017a9e0, 0x18)   =3D 0
futex(0x7fff1a9c4a7c, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NU=
LL, 7f801017a700) =3D -1 EAGAIN (Resource temporarily unavailable)
rt_sigaction(SIGRTMIN, {0x7f800f78c750, [], SA_RESTORER|SA_SIGINFO, 0x7f800=
f795cb0}, NULL, 8) =3D 0
rt_sigaction(SIGRT_1, {0x7f800f78c7e0, [], SA_RESTORER|SA_RESTART|SA_SIGINF=
O, 0x7f800f795cb0}, NULL, 8) =3D 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) =3D 0
getrlimit(RLIMIT_STACK, {rlim_cur=3D8192*1024, rlim_max=3DRLIM_INFINITY}) =
=3D 0
brk(0)                                  =3D 0xe74000
brk(0xe95000)                           =3D 0xe95000
fcntl(0, F_GETFD)                       =3D 0
fcntl(1, F_GETFD)                       =3D 0
fcntl(2, F_GETFD)                       =3D 0
rt_sigaction(SIGCHLD, {SIG_DFL, [CHLD], SA_RESTORER|SA_RESTART, 0x7f800f9d9=
4c0}, {SIG_DFL, [], 0}, 8) =3D 0
fstat(1, {st_mode=3DS_IFIFO|0600, st_size=3D0, ...}) =3D 0
chdir("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/meta-ide-support/1.0-r3/sysroot-destdir") =3D 0
newfstatat(AT_FDCWD, ".", {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}, AT_S=
YMLINK_NOFOLLOW) =3D 0
openat(AT_FDCWD, ".", O_RDONLY|O_NOCTTY|O_NONBLOCK|O_NOFOLLOW|O_CLOEXEC) =
=3D 10
fstat(10, {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}) =3D 0
fstat(10, {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}) =3D 0
fcntl(10, F_GETFL)                      =3D 0xa8800 (flags O_RDONLY|O_NONBL=
OCK|O_LARGEFILE|O_NOFOLLOW|O_CLOEXEC)
getdents(10, /* 2 entries */, 32768)    =3D 48
getdents(10, /* 0 entries */, 32768)    =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 11
connect(11, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(11)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 11
connect(11, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(11)                               =3D 0
open("/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) =3D 11
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D475, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f8010187000
read(11, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) =3D 475
read(11, "", 4096)                      =3D 0
close(11)                               =3D 0
munmap(0x7f8010187000, 4096)            =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_compat.so.2", O_RDONLY|O_CLOEXEC=
) =3D -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 11
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 11, 0) =3D 0x7f801017d000
close(11)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_compat.so.2", O_RDONLY|O_CLOEXEC) =3D 11
read(11, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\22\0\0\0\0\0\0"..=
=2E, 832) =3D 832
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D35680, ...}) =3D 0
mmap(NULL, 2131240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 11, 0) =
=3D 0x7f800f57d000
mprotect(0x7f800f585000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800f784000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 11, 0x7000) =3D 0x7f800f784000
close(11)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnsl.so.1", O_RDONLY|O_CLOEXEC) =3D -=
1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnsl.so.1", O_RDONLY|O_CLOEXEC) =3D 11
read(11, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`@\0\0\0\0\0\0"...,=
 832) =3D 832
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D97248, ...}) =3D 0
mmap(NULL, 2202328, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 11, 0) =
=3D 0x7f800f363000
mprotect(0x7f800f37a000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800f579000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 11, 0x16000) =3D 0x7f800f579000
mmap(0x7f800f57b000, 6872, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0x7f800f57b000
close(11)                               =3D 0
mprotect(0x7f800f579000, 4096, PROT_READ) =3D 0
mprotect(0x7f800f784000, 4096, PROT_READ) =3D 0
munmap(0x7f801017d000, 41689)           =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_nis.so.2", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 11
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 11, 0) =3D 0x7f801017d000
close(11)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_nis.so.2", O_RDONLY|O_CLOEXEC) =3D 11
read(11, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260 \0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D47680, ...}) =3D 0
mmap(NULL, 2143552, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 11, 0) =
=3D 0x7f800f157000
mprotect(0x7f800f161000, 2097152, PROT_NONE) =3D 0
mmap(0x7f800f361000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 11, 0xa000) =3D 0x7f800f361000
close(11)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_files.so.2", O_RDONLY|O_CLOEXEC)=
 =3D -1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_files.so.2", O_RDONLY|O_CLOEXEC) =3D 11
read(11, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@!\0\0\0\0\0\0"...,=
 832) =3D 832
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D52120, ...}) =3D 0
mmap(NULL, 2148472, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 11, 0) =
=3D 0x7f800ef4a000
mprotect(0x7f800ef56000, 2093056, PROT_NONE) =3D 0
mmap(0x7f800f155000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 11, 0xb000) =3D 0x7f800f155000
close(11)                               =3D 0
mprotect(0x7f800f155000, 4096, PROT_READ) =3D 0
mprotect(0x7f800f361000, 4096, PROT_READ) =3D 0
munmap(0x7f801017d000, 41689)           =3D 0
open("/etc/passwd", O_RDONLY|O_CLOEXEC) =3D 11
lseek(11, 0, SEEK_CUR)                  =3D 0
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D1972, ...}) =3D 0
mmap(NULL, 1972, PROT_READ, MAP_SHARED, 11, 0) =3D 0x7f8010187000
lseek(11, 1972, SEEK_SET)               =3D 1972
munmap(0x7f8010187000, 1972)            =3D 0
close(11)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 11
connect(11, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(11)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 11
connect(11, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(11)                               =3D 0
open("/etc/group", O_RDONLY|O_CLOEXEC)  =3D 11
lseek(11, 0, SEEK_CUR)                  =3D 0
fstat(11, {st_mode=3DS_IFREG|0644, st_size=3D817, ...}) =3D 0
mmap(NULL, 817, PROT_READ, MAP_SHARED, 11, 0) =3D 0x7f8010187000
lseek(11, 817, SEEK_SET)                =3D 817
munmap(0x7f8010187000, 817)             =3D 0
close(11)                               =3D 0
fstat(10, {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}) =3D 0
close(10)                               =3D 0
write(1, "./\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..=
=2E, 10240) =3D 10240
close(1)                                =3D 0
close(2)                                =3D 0
exit_group(0)                           =3D ?


strace from 2nd tar:
execve("/bin/tar", ["tar", "-xf", "-", "-C", "/home/jenkins/oe/shr-core-bra=
nch"...], [/* 83 vars */]) =3D 0
brk(0)                                  =3D 0x1525000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d946c000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/x86_64/librt.so.1", O_RDONLY|O_CLOEXE=
C) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/x86_64", 0x7fffd3e27ac0) =3D -1 ENOEN=
T (No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls/librt.so.1", O_RDONLY|O_CLOEXEC) =3D =
-1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/tls", 0x7fffd3e27ac0) =3D -1 ENOENT (No s=
uch file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/x86_64/librt.so.1", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/x86_64", 0x7fffd3e27ac0) =3D -1 ENOENT (N=
o such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib/librt.so.1", O_RDONLY|O_CLOEXEC) =3D -1 E=
NOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib", 0x7fffd3e27ac0) =3D -1 ENOENT (No such =
file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/x86_64/librt.so.1", O_RDONLY|O_CLOE=
XEC) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/x86_64", 0x7fffd3e27ac0) =3D -1 ENO=
ENT (No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls/librt.so.1", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/tls", 0x7fffd3e27ac0) =3D -1 ENOENT (No=
 such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/x86_64/librt.so.1", O_RDONLY|O_CLOEXEC)=
 =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/x86_64", 0x7fffd3e27ac0) =3D -1 ENOENT =
(No such file or directory)
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/librt.so.1", O_RDONLY|O_CLOEXEC) =3D -1=
 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64", {st_mode=3DS_IFDIR|0755, st_size=3D60=
, ...}) =3D 0
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 10
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 10, 0) =3D 0x7f24d9461000
close(10)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/librt.so.1", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340!\0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D31752, ...}) =3D 0
mmap(NULL, 2128984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d9044000
mprotect(0x7f24d904b000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d924a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x6000) =3D 0x7f24d924a000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) =3D -1 =
ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200\30\2\0\0\0\0\0=
"..., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0755, st_size=3D1802936, ...}) =3D 0
mmap(NULL, 3917016, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d8c87000
mprotect(0x7f24d8e3a000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d9039000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 10, 0x1b2000) =3D 0x7f24d9039000
mmap(0x7f24d903f000, 17624, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x7f24d903f000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200l\0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0755, st_size=3D135366, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d9460000
mmap(NULL, 2212904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d8a6a000
mprotect(0x7f24d8a82000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d8c81000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x17000) =3D 0x7f24d8c81000
mmap(0x7f24d8c83000, 13352, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x7f24d8c83000
close(10)                               =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d945f000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d945e000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d945d000
arch_prctl(ARCH_SET_FS, 0x7f24d945e700) =3D 0
mprotect(0x7f24d9039000, 16384, PROT_READ) =3D 0
mprotect(0x7f24d8c81000, 4096, PROT_READ) =3D 0
mprotect(0x7f24d924a000, 4096, PROT_READ) =3D 0
mprotect(0x647000, 4096, PROT_READ)     =3D 0
mprotect(0x7f24d946e000, 4096, PROT_READ) =3D 0
munmap(0x7f24d9461000, 41689)           =3D 0
set_tid_address(0x7f24d945e9d0)         =3D 5076
set_robust_list(0x7f24d945e9e0, 0x18)   =3D 0
futex(0x7fffd3e283bc, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NU=
LL, 7f24d945e700) =3D -1 EAGAIN (Resource temporarily unavailable)
rt_sigaction(SIGRTMIN, {0x7f24d8a70750, [], SA_RESTORER|SA_SIGINFO, 0x7f24d=
8a79cb0}, NULL, 8) =3D 0
rt_sigaction(SIGRT_1, {0x7f24d8a707e0, [], SA_RESTORER|SA_RESTART|SA_SIGINF=
O, 0x7f24d8a79cb0}, NULL, 8) =3D 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) =3D 0
getrlimit(RLIMIT_STACK, {rlim_cur=3D8192*1024, rlim_max=3DRLIM_INFINITY}) =
=3D 0
brk(0)                                  =3D 0x1525000
brk(0x1546000)                          =3D 0x1546000
fcntl(0, F_GETFD)                       =3D 0
fcntl(1, F_GETFD)                       =3D 0
fcntl(2, F_GETFD)                       =3D 0
rt_sigaction(SIGCHLD, {SIG_DFL, [CHLD], SA_RESTORER|SA_RESTART, 0x7f24d8cbd=
4c0}, {SIG_DFL, [], 0}, 8) =3D 0
geteuid()                               =3D 3004
umask(0)                                =3D 022
umask(022)                              =3D 0
read(0, "./\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...=
, 10240) =3D 10240
fstat(0, {st_mode=3DS_IFIFO|0600, st_size=3D0, ...}) =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 10
connect(10, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(10)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 10
connect(10, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(10)                               =3D 0
open("/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) =3D 10
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D475, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x7f24d946b000
read(10, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) =3D 475
read(10, "", 4096)                      =3D 0
close(10)                               =3D 0
munmap(0x7f24d946b000, 4096)            =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_compat.so.2", O_RDONLY|O_CLOEXEC=
) =3D -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 10
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 10, 0) =3D 0x7f24d9461000
close(10)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_compat.so.2", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\22\0\0\0\0\0\0"..=
=2E, 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D35680, ...}) =3D 0
mmap(NULL, 2131240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d8861000
mprotect(0x7f24d8869000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d8a68000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x7000) =3D 0x7f24d8a68000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnsl.so.1", O_RDONLY|O_CLOEXEC) =3D -=
1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnsl.so.1", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`@\0\0\0\0\0\0"...,=
 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D97248, ...}) =3D 0
mmap(NULL, 2202328, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d8647000
mprotect(0x7f24d865e000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d885d000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0x16000) =3D 0x7f24d885d000
mmap(0x7f24d885f000, 6872, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0x7f24d885f000
close(10)                               =3D 0
mprotect(0x7f24d885d000, 4096, PROT_READ) =3D 0
mprotect(0x7f24d8a68000, 4096, PROT_READ) =3D 0
munmap(0x7f24d9461000, 41689)           =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_nis.so.2", O_RDONLY|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 10
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D41689, ...}) =3D 0
mmap(NULL, 41689, PROT_READ, MAP_PRIVATE, 10, 0) =3D 0x7f24d9461000
close(10)                               =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_nis.so.2", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260 \0\0\0\0\0\0".=
=2E., 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D47680, ...}) =3D 0
mmap(NULL, 2143552, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d843b000
mprotect(0x7f24d8445000, 2097152, PROT_NONE) =3D 0
mmap(0x7f24d8645000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0xa000) =3D 0x7f24d8645000
close(10)                               =3D 0
open("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/../lib/pseudo/lib64/libnss_files.so.2", O_RDONLY|O_CLOEXEC)=
 =3D -1 ENOENT (No such file or directory)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libnss_files.so.2", O_RDONLY|O_CLOEXEC) =3D 10
read(10, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@!\0\0\0\0\0\0"...,=
 832) =3D 832
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D52120, ...}) =3D 0
mmap(NULL, 2148472, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 10, 0) =
=3D 0x7f24d822e000
mprotect(0x7f24d823a000, 2093056, PROT_NONE) =3D 0
mmap(0x7f24d8439000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 10, 0xb000) =3D 0x7f24d8439000
close(10)                               =3D 0
mprotect(0x7f24d8439000, 4096, PROT_READ) =3D 0
mprotect(0x7f24d8645000, 4096, PROT_READ) =3D 0
munmap(0x7f24d9461000, 41689)           =3D 0
open("/etc/passwd", O_RDONLY|O_CLOEXEC) =3D 10
lseek(10, 0, SEEK_CUR)                  =3D 0
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D1972, ...}) =3D 0
mmap(NULL, 1972, PROT_READ, MAP_SHARED, 10, 0) =3D 0x7f24d946b000
lseek(10, 1972, SEEK_SET)               =3D 1972
munmap(0x7f24d946b000, 1972)            =3D 0
close(10)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 10
connect(10, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(10)                               =3D 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) =3D 10
connect(10, {sa_family=3DAF_FILE, path=3D"/var/run/nscd/socket"}, 110) =3D =
-1 ENOENT (No such file or directory)
close(10)                               =3D 0
open("/etc/group", O_RDONLY|O_CLOEXEC)  =3D 10
lseek(10, 0, SEEK_CUR)                  =3D 0
fstat(10, {st_mode=3DS_IFREG|0644, st_size=3D817, ...}) =3D 0
mmap(NULL, 817, PROT_READ, MAP_SHARED, 10, 0) =3D 0x7f24d946b000
lseek(10, 817, SEEK_SET)                =3D 817
munmap(0x7f24d946b000, 817)             =3D 0
close(10)                               =3D 0
openat(AT_FDCWD, "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/meta-ide-support/1.0-r3/sstate-build-populate-s=
ysroot/sysroot-destdir", O_RDONLY|O_NOCTTY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC=
) =3D 10
mkdirat(10, ".", 0755)                  =3D -1 EEXIST (File exists)
newfstatat(10, ".", {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}, AT_SYMLINK=
_NOFOLLOW) =3D 0
newfstatat(10, ".", {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}, AT_SYMLINK=
_NOFOLLOW) =3D 0
close(0)                                =3D 0
newfstatat(10, ".", {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}, 0) =3D 0
newfstatat(10, ".", {st_mode=3DS_IFDIR|0755, st_size=3D40, ...}, 0) =3D 0
utimensat(10, ".", {{1359500812, 342476089}, {1359500811, 0}}, 0) =3D 0
close(1)                                =3D 0
close(2)                                =3D 0
exit_group(0)                           =3D ?

> and here is strace from that shell, no idea where that close(4294967295) =
came from
>=20
> Process 2553 attached - interrupt to quit
> wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 2554
> --- SIGCHLD (Child exited) @ 0 (0) ---
> rt_sigreturn(0x11)                      =3D 2554
> stat("/home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/scrip=
ts/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/usr/bin/armv5te-oe-linux-gnueabi/tar", 0x7fffc9269bf0) =3D -1 ENO=
ENT (No such file or directory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qem=
uarm/usr/bin/crossscripts/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file=
 or directory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/usr/sbin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or dir=
ectory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/usr/bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or dire=
ctory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/sbin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directo=
ry)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86=
_64-linux//bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directo=
ry)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/scrip=
ts/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
> stat("/home/jenkins/oe/shr-core-branches/shr-core/bitbake/bin/tar", 0x7ff=
fc9269bf0) =3D -1 ENOENT (No such file or directory)
> stat("/usr/local/bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or=
 directory)
> stat("/usr/bin/tar", 0x7fffc9269bf0)    =3D -1 ENOENT (No such file or di=
rectory)
> stat("/bin/tar", {st_mode=3DS_IFREG|0755, st_size=3D307760, ...}) =3D 0
> pipe([10, 11])                          =3D 0
> clone(child_stack=3D0, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SI=
GCHLD, child_tidptr=3D0x7f46963919d0) =3D 3068
> close(11)                               =3D 0
> clone(child_stack=3D0, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SI=
GCHLD, child_tidptr=3D0x7f46963919d0) =3D 3069
> close(10)                               =3D 0
> close(4294967295)                       =3D -1 EBADF (Bad file descriptor)
> wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3068
> --- SIGCHLD (Child exited) @ 0 (0) ---
> rt_sigreturn(0x11)                      =3D 3068
> wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3069
> --- SIGCHLD (Child exited) @ 0 (0) ---
> rt_sigreturn(0x11)                      =3D 3069
> exit_group(0)                           =3D ?
> Process 2553 detached
>=20
>=20
> >=20
> > Could it be caused by pseudo or something like that? do_populate_lic wo=
rks fine in other recipes.
> >=20
> > Running the same cmdline in shell works fine and running it from small =
=2Epy file also works fine:
> > $ PYTHONPATH=3D"openembedded-core/meta/lib/:bitbake/lib:bitbake/lib/bb"=
 ./copytree.test.py
> > copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir=
 -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/deploy/licenses'
> > Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-dest=
dir -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
> > execute_child(args, executable, preexec_fn, close_fds,
> > cwd, env, universal_newlines,
> > startupinfo, creationflags, shell,
> > p2cread, p2cwrite,
> > c2pread, c2pwrite,
> > errread, errwrite)
> > execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir=
 -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/deploy/licenses, None, None, False,
> > None, None, False,
> > None, 0,
> > True,
> > None, None,
> > 3, 4,
> > None, 4)
> >=20
> > $ cat copytree.test.py=20
> > #!/usr/bin/env python
> > import bb
> > import oe.path
> > src=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemu=
arm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir'
> > dst=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/li=
censes'
> > oe.path.copytree(src, dst)
> >=20
> > src has only few files, dst has a lot of directories:
> >=20
> > $ find /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemu=
arm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/world-image/1.0-r0/license-destdir
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/world-image/1.0-r0/license-destdir/world-image
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/world-image/1.0-r0/license-destdir/world-image/generic_MIT
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/world-image/1.0-r0/license-destdir/world-image/COPYING.MIT
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/world-image/1.0-r0/license-destdir/world-image/LICENSE
> >=20
> > $ ls /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/lice=
nses -1 | wc -l
> > 1696
> >=20
> > Complete error as shown in work/qemuarm-oe-linux-gnueabi/world-image/1.=
0-r0/temp/log.do_populate_lic:
> >=20
> > DEBUG: Executing python function sstate_task_prefunc
> > DEBUG: Removing manifest: /home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/deploy/licenses/world-image/
> > DEBUG: Python function sstate_task_prefunc finished
> > DEBUG: Executing python function do_populate_lic
> > DEBUG: Python function do_populate_lic finished
> > DEBUG: Executing python function sstate_task_postfunc
> > DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir =
to /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
> > DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir =
to /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
> > copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir=
 -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/deploy/licenses'
> > Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-dest=
dir -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
> > execute_child(args, executable, preexec_fn, close_fds,
> > cwd, env, universal_newlines,
> > startupinfo, creationflags, shell,
> > p2cread, p2cwrite,
> > c2pread, c2pwrite,
> > errread, errwrite)
> > execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir=
 -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/deploy/licenses, None, None, False,
> > None, None, False,
> > None, 0,
> > True,
> > None, None,
> > 20, 21,
> > None, 21)
> > ERROR: Error executing a python function in /home/jenkins/oe/shr-core-b=
ranches/shr-core/openembedded-core/meta/recipes-core/images/world-image.bb:
> > OSError: [Errno 7] Argument list too long
> >=20
> > ERROR: The stack trace of python calls that resulted in this exception/=
failure was:
> > ERROR:   File "sstate_task_postfunc", line 12, in <module>
> > ERROR:
> > ERROR:   File "sstate_task_postfunc", line 4, in sstate_task_postfunc
> > ERROR:
> > ERROR:   File "sstate.bbclass", line 76, in sstate_install
> > ERROR:
> > ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded=
-core/meta/lib/oe/path.py", line 85, in copytree
> > ERROR:     check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
> > ERROR:
> > ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded=
-core/meta/lib/oe/path.py", line 141, in check_output
> > ERROR:     process =3D subprocess.Popen(stdout=3Dsubprocess.PIPE, *pope=
nargs, **kwargs)
> > ERROR:
> > ERROR:   File "/usr/lib/python2.7/subprocess.py", line 679, in __init__
> > ERROR:     errread, errwrite)
> > ERROR:
> > ERROR:   File "/usr/lib/python2.7/subprocess.py", line 1249, in _execut=
e_child
> > ERROR:     raise child_exception
> > ERROR:
> > ERROR: The code that was being executed was:
> > ERROR:      0008:            bb.build.exec_func(intercept, d)
> > ERROR:      0009:        sstate_package(shared_state, d)
> > ERROR:      0010:
> > ERROR:      0011:
> > ERROR:  *** 0012:sstate_task_postfunc(d)
> > ERROR:      0013:
> > ERROR: [From file: 'sstate_task_postfunc', lineno: 12, function: <modul=
e>]
> > ERROR:      0001:
> > ERROR:      0002:def sstate_task_postfunc(d):
> > ERROR:      0003:    shared_state =3D sstate_state_fromvars(d)
> > ERROR:  *** 0004:    sstate_install(shared_state, d)
> > ERROR:      0005:    enabled =3D d.getVar('SSTATE_CREATE_PKG', True)
> > ERROR:      0006:    if enabled and enabled =3D=3D "1":
> > ERROR:      0007:        for intercept in shared_state['interceptfuncs'=
]:
> > ERROR:      0008:            bb.build.exec_func(intercept, d)
> > ERROR: [From file: 'sstate_task_postfunc', lineno: 4, function: sstate_=
task_postfunc]
> > ERROR:      0072:    f.close()
> > ERROR:      0073:
> > ERROR:      0074:    # Run the actual file install
> > ERROR:      0075:    for state in ss['dirs']:
> > ERROR:  *** 0076:        oe.path.copytree(state[1], state[2])
> > ERROR:      0077:
> > ERROR:      0078:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', T=
rue) or '').split():
> > ERROR:      0079:        bb.build.exec_func(postinst, d)
> > ERROR:      0080:
> > ERROR: [From file: 'sstate.bbclass', lineno: 76, function: sstate_insta=
ll]
> > DEBUG: Python function sstate_task_postfunc finished
> > ERROR: Function failed: sstate_task_postfunc
> >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jnHBos+GICmmswJV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEIV3YACgkQN1Ujt2V2gBxSjQCgoHzL+CYQEHk+Uggqa4KuTpog
DdIAoKuPcGBxqWFoDIfu2f8MWBQFHjbF
=EtFp
-----END PGP SIGNATURE-----

--jnHBos+GICmmswJV--
