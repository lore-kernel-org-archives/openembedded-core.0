Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TZSgd-0006z6-SN for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 21:38:51 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TZSTH-00084W-F6 for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 21:25:03 +0100
Received: from cpc16-hawk13-2-0-cust49.18-1.cable.virginmedia.com
	([82.45.45.50]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 21:25:03 +0100
Received: from quentinstrydom8 by
	cpc16-hawk13-2-0-cust49.18-1.cable.virginmedia.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 21:25:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Quentin <quentinstrydom8@yahoo.co.uk>
Date: Fri, 16 Nov 2012 20:11:08 +0000 (UTC)
Message-ID: <loom.20121116T205858-268@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 82.45.45.50 (Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20100101 Firefox/16.0)
Subject: Python failure
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
X-List-Received-Date: Fri, 16 Nov 2012 20:38:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

ERROR: Multiple .bb files are due to be built which each provide udev
(/oe-core/meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb
/oe-core/meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Variable populate_packages contains tabs, please remove these
(/oe-core/meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb)
ERROR: Error executing a python function in
/oe-core/meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb:
OSError: [Errno 2] No such file or directory:
'/oe-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/udev-182-r1/packages-
split/systemd-gui'

ERROR: The stack trace of python calls that resulted in this exception/failure 
was:
ERROR:   File "do_package_ipk", line 193, in <module>
ERROR: 
ERROR:   File "do_package_ipk", line 45, in do_package_ipk
ERROR: 
ERROR: The code that was being executed was:
ERROR:      0189:        bb.utils.unlockfile(lf)
ERROR:      0190:
ERROR:      0191:
ERROR:      0192:
ERROR:  *** 0193:do_package_ipk(d)
ERROR:      0194:
ERROR: [From file: 'do_package_ipk', lineno: 193, function: <module>]
ERROR:      0041:        basedir = os.path.join(os.path.dirname(root))
ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH', True)
ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)
ERROR:      0044:        bb.mkdirhier(pkgoutdir)
ERROR:  *** 0045:        os.chdir(root)
ERROR:      0046:        from glob import glob
ERROR:      0047:        g = glob('*')
ERROR:      0048:        try:
ERROR:      0049:            del g[g.index('CONTROL')]
ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
  File "run_buildstats(e)", line 104, in run_buildstats(e=<bb.build.TaskFailed
object at 0xb0066cc>)
  File "buildstats.bbclass", line 5, in write_task_data(status='failed',
logfile='/oe-core/tmp-eglibc/buildstats/xfce-nm-image-igep00x0/201211161930
udev-182-r1/do_package_write_ipk',
dev='dm-0', e=<bb.build.TaskFailed object at 0xb0066cc>)
IOError: [Errno 2] No such file or directory:
'/oe-core/tmp-eglibc/buildstats/xfce-nm-image-igep00x0/201211161930/udev-182-r1
do_package_write_ipk'

ERROR: Logfile of failure stored in:
/oe-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r10
temp/log.do_package_write_ipk.28897
ERROR: Task 785
(/oe-core/meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb,

do_package_write_ipk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2852 tasks of which 2851 didn't need to be rerun
and 1 failed.
No currently running tasks (2852 of 5124)


Summary: 1 task failed:
  /oe-core/meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb,
do_package_write_ipk

Summary: There were 1801 WARNING messages shown.
Summary: There were 27 ERROR messages shown, returning a non-zero exit code.




