Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 659037FCAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:08:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g17so19793699wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 04:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UlrTGtCR5KQYOvp+RTmzIWjTqJ1e85b6PTzsUrJ0NGw=;
	b=yV4j7cS0hx/Dvgf1+8itj0AoFCwhZb5/Rab0zUCT0yjRsvqxI0jy3y+2a0lHN2UgTQ
	Z6sBaOZpmtXu14uUw1PTDER+gAD92hotKivR3obwZm/BejueLLCeOqmx3MvG7c2CPKXd
	uXsyEpjZdCsHBloVXGFoEvbraxO4+PT8r8eZ3jL8mGMSHgCU8vSXvUrDoYoaBcqX2V4M
	m8rcBv/3M99F93Gzp/QQDVgYb3+oZs5hZtZaQYjXLBjxxMXplssnLf/28XJWWTlsxxQt
	6NBqRNvMxuEDt32u//yEEyDZ/PxSUvSZwltszkEcBAt/h9ymKkzMsYN1Z2pFlMjZJBqD
	aW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UlrTGtCR5KQYOvp+RTmzIWjTqJ1e85b6PTzsUrJ0NGw=;
	b=kz4mb6gxoqn9PXWCyjSkCFjJ/8rRPfxle+T+2BGWGp1R1fxonZUh1nLwyVmAqteD6v
	rz9MLFwG+d8xXjdbGh8AjAvJhVGuZmdXeX5H2WI33wgoFfywUyURsbAoWWc4ty9ELgxM
	MRCkHUTsd4H7PqllcFHo2cAZcPcE16NSsnCEx7v3sWloMLy02KkAh/qNEEET4GhcTzy3
	YepSH9MtVb0vrO6j+oACayM/HRJcHqc/zq74j3oXDG1MQ2Gj+6zmRIdUOHS9lTGRdoHV
	aPnth1jcguh6zum0DkDWlCsbTNtX8Al/EYude50RUwneqY9X25SpjKJVU7/2a3jSMll0
	OpoA==
X-Gm-Message-State: APjAAAXG0qprcnSaT3vPKTwgaEIXjc/0d3foAZAagyh57rnNabsp/Aef
	6k+WgVg0q2WAWPyGfP5wb1yR/caw3h0=
X-Google-Smtp-Source: APXvYqx8/c76rDnBAnayacjow5Q6lD161lHPaEU3weArGnUoqYzI+G6X4DhUFoyVC9kvKYZ5c4iTrg==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr2989875wrh.121.1575979702312; 
	Tue, 10 Dec 2019 04:08:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n16sm2961022wro.88.2019.12.10.04.08.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 04:08:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 12:08:17 +0000
Message-Id: <20191210120817.8374-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] scripts: add pkgdataui
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
X-List-Received-Date: Tue, 10 Dec 2019 12:08:22 -0000
Content-Transfer-Encoding: 8bit

pkgdataui is a Python 3/GObject Introspection/GTK+ 3 tool to browse the pkgdata
database at your leisure.  By being graphical it is easier to explore and can
follow links between packages.

This is very much a work in progress, so be gentle and patches are welcome.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/pkgdataui.glade | 335 ++++++++++++++++++++++++++++++++++++++++
 scripts/pkgdataui.py    | 241 +++++++++++++++++++++++++++++
 2 files changed, 576 insertions(+)
 create mode 100644 scripts/pkgdataui.glade
 create mode 100755 scripts/pkgdataui.py

diff --git a/scripts/pkgdataui.glade b/scripts/pkgdataui.glade
new file mode 100644
index 00000000000..04e987b975e
--- /dev/null
+++ b/scripts/pkgdataui.glade
@@ -0,0 +1,335 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!-- Generated with glade 3.18.3 -->
+<interface>
+  <requires lib="gtk+" version="3.12"/>
+  <object class="GtkListStore" id="file_store">
+    <columns>
+      <!-- column-name Filename -->
+      <column type="gchararray"/>
+      <!-- column-name Size -->
+      <column type="glong"/>
+    </columns>
+  </object>
+  <object class="GtkListStore" id="package_store">
+    <columns>
+      <!-- column-name Package -->
+      <column type="gchararray"/>
+      <!-- column-name Size -->
+      <column type="glong"/>
+    </columns>
+  </object>
+  <object class="GtkListStore" id="pkgdata_store">
+    <columns>
+      <!-- column-name Name -->
+      <column type="gchararray"/>
+      <!-- column-name Path -->
+      <column type="gchararray"/>
+    </columns>
+  </object>
+  <object class="GtkListStore" id="recipe_store">
+    <columns>
+      <!-- column-name Recipe -->
+      <column type="gchararray"/>
+    </columns>
+  </object>
+  <object class="GtkWindow" id="window">
+    <property name="can_focus">False</property>
+    <property name="title" translatable="yes">Package Data Browser</property>
+    <property name="icon_name">accessories-dictionary</property>
+    <property name="has_resize_grip">True</property>
+    <child>
+      <object class="GtkBox" id="box1">
+        <property name="visible">True</property>
+        <property name="can_focus">False</property>
+        <property name="margin_left">4</property>
+        <property name="margin_right">4</property>
+        <property name="margin_top">4</property>
+        <property name="margin_bottom">4</property>
+        <property name="orientation">vertical</property>
+        <property name="spacing">4</property>
+        <child>
+          <object class="GtkComboBox" id="pkgdata_combo">
+            <property name="can_focus">False</property>
+            <property name="model">pkgdata_store</property>
+            <property name="id_column">1</property>
+            <child>
+              <object class="GtkCellRendererText" id="cellrenderertext5"/>
+              <attributes>
+                <attribute name="text">0</attribute>
+              </attributes>
+            </child>
+          </object>
+          <packing>
+            <property name="expand">False</property>
+            <property name="fill">True</property>
+            <property name="position">0</property>
+          </packing>
+        </child>
+        <child>
+          <object class="GtkPaned" id="paned1">
+            <property name="visible">True</property>
+            <property name="can_focus">True</property>
+            <property name="position">200</property>
+            <property name="position_set">True</property>
+            <child>
+              <object class="GtkScrolledWindow" id="scrolledwindow1">
+                <property name="visible">True</property>
+                <property name="can_focus">True</property>
+                <property name="shadow_type">in</property>
+                <property name="min_content_width">100</property>
+                <child>
+                  <object class="GtkTreeView" id="recipe_view">
+                    <property name="visible">True</property>
+                    <property name="can_focus">True</property>
+                    <property name="model">recipe_store</property>
+                    <property name="search_column">0</property>
+                    <property name="fixed_height_mode">True</property>
+                    <property name="show_expanders">False</property>
+                    <child internal-child="selection">
+                      <object class="GtkTreeSelection" id="treeview-selection1"/>
+                    </child>
+                    <child>
+                      <object class="GtkTreeViewColumn" id="treeviewcolumn1">
+                        <property name="sizing">fixed</property>
+                        <property name="title" translatable="yes">Recipe</property>
+                        <child>
+                          <object class="GtkCellRendererText" id="cellrenderertext1"/>
+                          <attributes>
+                            <attribute name="text">0</attribute>
+                          </attributes>
+                        </child>
+                      </object>
+                    </child>
+                  </object>
+                </child>
+              </object>
+              <packing>
+                <property name="resize">False</property>
+                <property name="shrink">True</property>
+              </packing>
+            </child>
+            <child>
+              <object class="GtkPaned" id="paned2">
+                <property name="visible">True</property>
+                <property name="can_focus">True</property>
+                <property name="position">200</property>
+                <property name="position_set">True</property>
+                <child>
+                  <object class="GtkScrolledWindow" id="scrolledwindow2">
+                    <property name="visible">True</property>
+                    <property name="can_focus">True</property>
+                    <property name="shadow_type">in</property>
+                    <property name="min_content_width">100</property>
+                    <child>
+                      <object class="GtkTreeView" id="package_view">
+                        <property name="visible">True</property>
+                        <property name="can_focus">True</property>
+                        <property name="model">package_store</property>
+                        <property name="search_column">0</property>
+                        <property name="show_expanders">False</property>
+                        <child internal-child="selection">
+                          <object class="GtkTreeSelection" id="treeview-selection2"/>
+                        </child>
+                        <child>
+                          <object class="GtkTreeViewColumn" id="package_name_column">
+                            <property name="resizable">True</property>
+                            <property name="sizing">autosize</property>
+                            <property name="title" translatable="yes">Package</property>
+                            <property name="sort_column_id">0</property>
+                            <child>
+                              <object class="GtkCellRendererText" id="cellrenderertext2"/>
+                              <attributes>
+                                <attribute name="text">0</attribute>
+                              </attributes>
+                            </child>
+                          </object>
+                        </child>
+                        <child>
+                          <object class="GtkTreeViewColumn" id="package_size_column">
+                            <property name="resizable">True</property>
+                            <property name="sizing">autosize</property>
+                            <property name="title" translatable="yes">Size</property>
+                            <property name="sort_column_id">1</property>
+                            <child>
+                              <object class="GtkCellRendererText" id="package_size_cell"/>
+                            </child>
+                          </object>
+                        </child>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="resize">False</property>
+                    <property name="shrink">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkBox" id="box2">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="margin_left">4</property>
+                    <property name="orientation">vertical</property>
+                    <property name="spacing">4</property>
+                    <child>
+                      <object class="GtkLabel" id="label1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">label</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">0</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkLabel" id="depends_label">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">depends_label</property>
+                        <property name="wrap">True</property>
+                        <property name="track_visited_links">False</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">1</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkLabel" id="recommends_label">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">recs_label</property>
+                        <property name="wrap">True</property>
+                        <property name="track_visited_links">False</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">2</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkLabel" id="suggests_label">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">suggests_label</property>
+                        <property name="wrap">True</property>
+                        <property name="track_visited_links">False</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">3</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkLabel" id="provides_label">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">provides_label</property>
+                        <property name="wrap">True</property>
+                        <property name="track_visited_links">False</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">4</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkLabel" id="files_label">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="xalign">0</property>
+                        <property name="label" translatable="yes">files_label</property>
+                        <property name="ellipsize">end</property>
+                      </object>
+                      <packing>
+                        <property name="expand">False</property>
+                        <property name="fill">True</property>
+                        <property name="position">5</property>
+                      </packing>
+                    </child>
+                    <child>
+                      <object class="GtkScrolledWindow" id="files_scrollview">
+                        <property name="visible">True</property>
+                        <property name="can_focus">True</property>
+                        <property name="shadow_type">in</property>
+                        <child>
+                          <object class="GtkTreeView" id="files_view">
+                            <property name="visible">True</property>
+                            <property name="can_focus">True</property>
+                            <property name="model">file_store</property>
+                            <property name="rules_hint">True</property>
+                            <property name="search_column">0</property>
+                            <property name="show_expanders">False</property>
+                            <child internal-child="selection">
+                              <object class="GtkTreeSelection" id="treeview-selection3"/>
+                            </child>
+                            <child>
+                              <object class="GtkTreeViewColumn" id="file_name_column">
+                                <property name="title" translatable="yes">Name</property>
+                                <property name="sort_indicator">True</property>
+                                <property name="sort_column_id">0</property>
+                                <child>
+                                  <object class="GtkCellRendererText" id="cellrenderertext3">
+                                    <property name="background_rgba">rgba(0,0,0,0)</property>
+                                  </object>
+                                  <attributes>
+                                    <attribute name="text">0</attribute>
+                                  </attributes>
+                                </child>
+                              </object>
+                            </child>
+                            <child>
+                              <object class="GtkTreeViewColumn" id="treeviewcolumn4">
+                                <property name="title" translatable="yes">Size</property>
+                                <property name="sort_indicator">True</property>
+                                <property name="sort_column_id">1</property>
+                                <child>
+                                  <object class="GtkCellRendererText" id="cellrenderertext4"/>
+                                  <attributes>
+                                    <attribute name="text">1</attribute>
+                                  </attributes>
+                                </child>
+                              </object>
+                            </child>
+                          </object>
+                        </child>
+                      </object>
+                      <packing>
+                        <property name="expand">True</property>
+                        <property name="fill">True</property>
+                        <property name="position">6</property>
+                      </packing>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="resize">True</property>
+                    <property name="shrink">True</property>
+                  </packing>
+                </child>
+              </object>
+              <packing>
+                <property name="resize">True</property>
+                <property name="shrink">True</property>
+              </packing>
+            </child>
+          </object>
+          <packing>
+            <property name="expand">True</property>
+            <property name="fill">True</property>
+            <property name="position">1</property>
+          </packing>
+        </child>
+      </object>
+    </child>
+  </object>
+</interface>
diff --git a/scripts/pkgdataui.py b/scripts/pkgdataui.py
new file mode 100755
index 00000000000..f6b23fc0be6
--- /dev/null
+++ b/scripts/pkgdataui.py
@@ -0,0 +1,241 @@
+#! /usr/bin/env python3
+
+import os, sys, enum, ast
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+
+import scriptpath
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    print("Unable to find bitbake by searching parent directory of this script or PATH")
+    sys.exit(1)
+import bb
+
+import gi
+gi.require_version('Gtk', '3.0')
+from gi.repository import Gtk, Gdk, GObject
+
+RecipeColumns = enum.IntEnum("RecipeColumns", {"Recipe": 0})
+PackageColumns = enum.IntEnum("PackageColumns", {"Package": 0, "Size": 1})
+FileColumns = enum.IntEnum("FileColumns", {"Filename": 0, "Size": 1})
+
+import time
+def timeit(f):
+    def timed(*args, **kw):
+        ts = time.time()
+        print ("func:%r calling" % f.__name__)
+        result = f(*args, **kw)
+        te = time.time()
+        print ('func:%r args:[%r, %r] took: %2.4f sec' % \
+          (f.__name__, args, kw, te-ts))
+        return result
+    return timed
+
+def human_size(nbytes):
+    import math
+    suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB']
+    human = nbytes
+    rank = 0
+    if nbytes != 0:
+        rank = int((math.log10(nbytes)) / 3)
+        rank = min(rank, len(suffixes) - 1)
+        human = nbytes / (1000.0 ** rank)
+    f = ('%.2f' % human).rstrip('0').rstrip('.')
+    return '%s %s' % (f, suffixes[rank])
+
+def load(filename, suffix=None):
+    from configparser import ConfigParser
+    from itertools import chain
+
+    parser = ConfigParser()
+    if suffix:
+        parser.optionxform = lambda option: option.replace("_" + suffix, "")
+    with open(filename) as lines:
+        lines = chain(("[fake]",), lines)
+        parser.read_file(lines)
+
+    # TODO extract the data and put it into a real dict so we can transform some
+    # values to ints?
+    return parser["fake"]
+
+def find_pkgdata():
+    import subprocess
+    output = subprocess.check_output(("bitbake", "-e"), universal_newlines=True)
+    for line in output.splitlines():
+        if line.startswith("PKGDATA_DIR="):
+            return line.split("=", 1)[1].strip("\'\"")
+    # TODO exception or something
+    return None
+
+def packages_in_recipe(pkgdata, recipe):
+    """
+    Load the recipe pkgdata to determine the list of runtime packages.
+    """
+    data = load(os.path.join(pkgdata, recipe))
+    packages = data["PACKAGES"].split()
+    return packages
+
+def load_runtime_package(pkgdata, package):
+    return load(os.path.join(pkgdata, "runtime", package), suffix=package)
+
+def recipe_from_package(pkgdata, package):
+    data = load(os.path.join(pkgdata, "runtime", package), suffix=package)
+    return data["PN"]
+
+def summary(data):
+    s = ""
+    s += "{0[PKG]} {0[PKGV]}-{0[PKGR]}\n{0[LICENSE]}\n{0[SUMMARY]}\n".format(data)
+
+    return s
+
+
+class PkgUi():
+    def __init__(self, pkgdata):
+        self.pkgdata = pkgdata
+        self.current_recipe = None
+        self.recipe_iters = {}
+        self.package_iters = {}
+
+        builder = Gtk.Builder()
+        builder.add_from_file(os.path.join(os.path.dirname(__file__), "pkgdataui.glade"))
+
+        self.window = builder.get_object("window")
+        self.window.connect("delete-event", Gtk.main_quit)
+
+        self.recipe_store = builder.get_object("recipe_store")
+        self.recipe_view = builder.get_object("recipe_view")
+        self.package_store = builder.get_object("package_store")
+        self.package_view = builder.get_object("package_view")
+
+        # Somehow resizable does not get set via builder xml
+        package_name_column = builder.get_object("package_name_column")
+        package_name_column.set_resizable(True)
+        file_name_column = builder.get_object("file_name_column")
+        file_name_column.set_resizable(True)
+
+        self.recipe_view.get_selection().connect("changed", self.on_recipe_changed)
+        self.package_view.get_selection().connect("changed", self.on_package_changed)
+
+        self.package_store.set_sort_column_id(PackageColumns.Package, Gtk.SortType.ASCENDING)
+        builder.get_object("package_size_column").set_cell_data_func(builder.get_object("package_size_cell"), lambda column, cell, model, iter, data: cell.set_property("text", human_size(model[iter][PackageColumns.Size])))
+
+        self.label = builder.get_object("label1")
+        self.depends_label = builder.get_object("depends_label")
+        self.recommends_label = builder.get_object("recommends_label")
+        self.suggests_label = builder.get_object("suggests_label")
+        self.provides_label = builder.get_object("provides_label")
+
+        self.depends_label.connect("activate-link", self.on_link_activate)
+        self.recommends_label.connect("activate-link", self.on_link_activate)
+        self.suggests_label.connect("activate-link", self.on_link_activate)
+
+        self.file_store = builder.get_object("file_store")
+        self.file_store.set_sort_column_id(FileColumns.Filename, Gtk.SortType.ASCENDING)
+        self.files_view = builder.get_object("files_scrollview")
+        self.files_label = builder.get_object("files_label")
+
+        self.load_recipes()
+
+        self.recipe_view.set_cursor(Gtk.TreePath.new_first())
+
+        self.window.show()
+
+    def on_link_activate(self, label, url_string):
+        from urllib.parse import urlparse
+        url = urlparse(url_string)
+        if url.scheme == "package":
+            package = url.path
+            recipe = recipe_from_package(self.pkgdata, package)
+
+            it = self.recipe_iters[recipe]
+            path = self.recipe_store.get_path(it)
+            self.recipe_view.set_cursor(path)
+            self.recipe_view.scroll_to_cell(path)
+
+            self.on_recipe_changed(self.recipe_view.get_selection())
+
+            it = self.package_iters[package]
+            path = self.package_store.get_path(it)
+            self.package_view.set_cursor(path)
+            self.package_view.scroll_to_cell(path)
+
+            return True
+        else:
+            return False
+
+    def on_recipe_changed(self, selection):
+        self.package_store.clear()
+        self.package_iters = {}
+
+        (model, it) = selection.get_selected()
+        if not it:
+            return
+
+        recipe = model[it][RecipeColumns.Recipe]
+        for package in packages_in_recipe(self.pkgdata, recipe):
+            # TODO also show PKG after debian-renaming?
+            data = load_runtime_package(self.pkgdata, package)
+            # TODO stash data to avoid reading in on_package_changed
+            self.package_iters[package] = self.package_store.append([package, int(data["PKGSIZE"])])
+
+    def on_package_changed(self, selection):
+        self.label.set_text("")
+        self.file_store.clear()
+        self.depends_label.hide()
+        self.recommends_label.hide()
+        self.suggests_label.hide()
+
+        (model, it) = selection.get_selected()
+        if it is None:
+            return
+
+        package = model[it][PackageColumns.Package]
+        data = load_runtime_package(self.pkgdata, package)
+
+        self.label.set_text(summary(data))
+
+        files = ast.literal_eval(data["FILES_INFO"])
+        if files:
+            self.files_label.set_text("{0} files take {1}.".format(len(files), human_size(int(data["PKGSIZE"]))))
+            self.files_view.show()
+            for filename, size in files.items():
+                self.file_store.append([filename, size])
+        else:
+            self.files_view.hide()
+            self.files_label.set_text("This package has no files.")
+
+        def update_deps(field, prefix, label, clickable=True):
+            if field in data:
+                l = []
+                for name, version in bb.utils.explode_dep_versions2(data[field]).items():
+                    if clickable:
+                        l.append("<a href='package:{0}'>{0}</a> {1}".format(name, " ".join(version)))
+                    else:
+                        l.append("{0} {1}".format(name, " ".join(version)))
+                label.set_markup(prefix + ", ".join(l))
+                label.show()
+            else:
+                label.hide()
+        update_deps("RDEPENDS", "Depends: ", self.depends_label)
+        update_deps("RRECOMMENDS", "Recommends: ", self.recommends_label)
+        update_deps("RSUGGESTS", "Suggests: ", self.suggests_label)
+        update_deps("RPROVIDES", "Provides: ", self.provides_label, clickable=False)
+
+    def load_recipes(self):
+        for recipe in sorted(os.listdir(pkgdata)):
+            if os.path.isfile(os.path.join(pkgdata, recipe)):
+                self.recipe_iters[recipe] = self.recipe_store.append([recipe])
+
+if __name__ == "__main__":
+    import argparse
+
+    parser = argparse.ArgumentParser(description='pkgdata browser')
+    parser.add_argument('-p', '--pkgdata', help="Optional location of pkgdata")
+
+    args = parser.parse_args()
+    pkgdata = args.pkgdata if args.pkgdata else find_pkgdata()
+    # TODO assert pkgdata is a directory
+    window = PkgUi(pkgdata)
+    Gtk.main()
-- 
2.20.1


